Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C742821CC2
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 19:45:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455G0y6xxDzDqSl
	for <lists+openbmc@lfdr.de>; Sat, 18 May 2019 03:45:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455G0J3T6NzDqS4
 for <openbmc@lists.ozlabs.org>; Sat, 18 May 2019 03:45:18 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 May 2019 10:45:15 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by orsmga008.jf.intel.com with ESMTP; 17 May 2019 10:45:15 -0700
Subject: Re: [phosphor-webui] Enable style-src 'unsafe-inline'
To: Henbin Chang <henbinchang@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAG9c7cDx5rw50zK0WnF20PqFFU_pGdDZ1fvk15PASeGeKsH-+w@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <19be2af8-7b88-5183-44c1-d27fddec29c3@intel.com>
Date: Fri, 17 May 2019 10:45:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAG9c7cDx5rw50zK0WnF20PqFFU_pGdDZ1fvk15PASeGeKsH-+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/17/19 12:05 AM, Henbin Chang wrote:
> Hi,
> We would like to use angular-ui-grid module to support grid feature.

For what feature/page/use case?  Adding a little more detail on what
you're trying to accomplish might allow someone to suggest an
alternative that gets what you want easier.

> 
> We found angular-ui-grid used a lot of inline styles.

For reference, I found an open issue from 2017 on this.
https://github.com/angular-ui/ui-grid/issues/6031

> 
> To make it workable, we had to add "unsafe-inline" to CSP.

I'm going to be pretty adamantly against that ever making it to master.
"unsafe" is literally in the name of the header, and it's going to cause
us to get flagged in security scanners.

If that package is something you _really_ want, it's likely that the
inline styles can be moved to ids, and we can send them the patch, then
pull in the new version.

A quick look at there shows they're pulling styles from javascript via
calls like:
ng-style="Viewport.rowStyle(rowRenderIndex)"
which is exactly what we're trying to prevent with these headers.  When
I dig into the rowStyle function, it looks like they're mostly
calculating X and Y position in javascript, and loading it into the
style tag.  That's going to be hard to manage, but if you know the
behavior, it might be doable with empty div elements and size tags.

> So we added the below modification in the phosphor-webui/webpack.config.js
>      new CSPWebpackPlugin({
>        'base-uri': '\'self\'',
>        'object-src': '\'none\'',
>    'script-src': ['\'self\''],
> -      'style-src': ['\'self\''],
> +      'style-src': ['\'self\'', '\'unsafe-inline\'' ],
> 
> But the grid could still not work.
> 
> Then we tried to modify the content of  CSP in the bmcweb 
> (include/security_headers_middleware.hpp)
> 
> @@ -41,7 +41,7 @@ struct SecurityHeadersMiddleware
>        // img-src 'self' data: is used to allow that.
>        //
> https://stackoverflow.com/questions/18447970/content-security-policy-data-not-working-for-base64-images-in-chrome-28
>        res.addHeader("Content-Security-Policy",
> -                      "default-src 'self'; img-src 'self' data:");
> +                      "default-src 'self'; style-src 'self'
> 'unsafe-inline'; img-src 'self' data:");
>        res.addHeader("X-XSS-Protection", "1; "
>                                            "mode=block");
>        res.addHeader("X-Content-Type-Options", "nosniff");
> 
> The grid could be displayed normally.
> 
> Can anyone tell me why the modified CSP in the webpack.config.js had no
> effect?
The CSP in webpack sets the content security policy in the HTML meta tag
in head, like so:
<html ng-app="app" ng-csp="" lang="en">
    <head>
        <meta http-equiv="Content-Security-Policy" content="base-uri
'self'; object-src 'none'; script-src 'self'; style-src 'self'; img-src
'self' data:">

Given that there are a couple HTML files aren't actually generated by
webpack, and would otherwise take the default CSP, bmcweb also sets the
CSP header in the response:
Content-Security-Policy: default-src 'self'; img-src 'self' data:

I'm actually unsure about the browser behavior when the two conflict.
Based on what you're seeing, I'm going to assume that the browser takes
the more secure option of the two, and you need both to get the behavior
you want.



