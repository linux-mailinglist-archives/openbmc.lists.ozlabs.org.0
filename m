Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB063BEC4
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 23:37:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45N61L6LwSzDqSB
	for <lists+openbmc@lfdr.de>; Tue, 11 Jun 2019 07:37:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45N60l649LzDqPM
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jun 2019 07:37:05 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 14:37:01 -0700
X-ExtLoop1: 1
Received: from hades.jf.intel.com (HELO [10.54.51.78]) ([10.54.51.78])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jun 2019 14:37:01 -0700
Subject: Re: Proposal to replace Clang Format with ESLint and Prettier in
 phosphor-webui
To: openbmc@lists.ozlabs.org
References: <CAOUmYFRfVQha0NCZd2aLTc-EC2GNF8wuXqnAyWNMCpzcecQUKw@mail.gmail.com>
From: Ed Tanous <ed.tanous@intel.com>
Message-ID: <6f963ba0-467f-14fe-ac0b-7c09b547d109@intel.com>
Date: Mon, 10 Jun 2019 14:37:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAOUmYFRfVQha0NCZd2aLTc-EC2GNF8wuXqnAyWNMCpzcecQUKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 6/6/19 7:37 PM, Derick wrote:
> Hello,
> 
> I propose we replace Clang Format in the phosphor-webui with an ESLint
> and Prettier configuration. Clang format handles formatting reasonably
> well, but it doesn't offer the ability to help identify potential
> errors.
> 
> We can run ESLint and Prettier from the command-line and integrate
> them into our editors. I have included links to the documentation for
> the resources and would like to continue the conversation in the
> Gerrit (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/22366).


In reading the last couple paragraphs, I think we really need a good
statement of "why" we want this change.  I think we really need to
separate out ESlint, and Prettier as separate tools, with specific
reasons for using them.

For what it's worth, my "why" for ESlint was that it would make webui
code easier and faster to code review for correctness.  I'm not sure
ESLint really accomplished that goal.

ESLint:

My 2 cents:  As I'm sure you're aware, I started an attempt to get
ESlint going on the webui.  It was a good experiment, but overall, I'm
not convinced of its value in the value/time equation.
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/15968

If I look through the changes that got made to make Eslint pass, I'm was
not seeing a lot of value for the time.  Most of it seems like brace
styling, semicolon policies, and debates about var vs let vs const
variable declarations.

Don't get me wrong, I'm all for consistent braces, but I don't think
it's the biggest issue we face, or really worth the time it would take
to get the builds working and passing.  Very rarely do we need to rework
the webui, tackle bugs, or revert patches because of those issues.

If ESlint is really something you want to tackle, by all means, but in
terms of value to the end user, I suspect it's a wash.

Prettier:
I struggle with this one, because as a whole, this project seems to use
clang-format for most everything else.  In the research I've done, I
wasn't able to find something that Prettier does significantly better
than clang-format, with the exception of maybe being more "standard" in
the javascript realm.  I'd much rather OpenBMC sticks with something
that's consistent than say every language gets its own formatting library.

> 
> My initial goal was to use the Angular 1 Style Guide's shared eslint
> and the ESLint recommended configurations.

If you start with eslint-config-google, the changes are a lot less
invasive, as we're pretty close to being compliant.

> However, those options
> require a considerable amount of effort to update and regression test
> to be compliant. For now,  I have added a few Angular and ESLint rules
> to the configuration that are categorized either as possible errors or
> best practices. If we decide the AngularJS community's suggested best
> practices will improve our code base, we can develop a plan to
> implement those changes in a phased approach.

This is some of what stopped me.  If we're going to go to this level of
effort, my gut said we're a lot better off going to typescript and
Angular 2.X+, rather than continuing to rework our angular 1.X stuff to
use more "best practices" on the less-than-up-to-date stack we're using.
 At one point I had looked at moving forward with Angular 2 and
typescript, and tried to sketch out the path to get there, but it
quickly got out of hand.


> 
> - ESLint: https://eslint.org/
> - Prettier: https://prettier.io/
> - ESLlint Angular Plugin: https://www.npmjs.com/package/eslint-plugin-angular
> - Angular 1 Style Guide:
> https://github.com/johnpapa/angular-styleguide/tree/master/a1
> - Gerrit Review:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/22366
> 
