Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 102191E53D3
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 04:21:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XWf8748yzDqM0
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 12:21:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=saravanan.palanisamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XWd94FqrzDqL9
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 12:20:28 +1000 (AEST)
IronPort-SDR: GnAjy0mdqIKVLF+52fbZC5c+Ub6DH3GCqNPRY86PM5LptXQv23QZ1jTus2G/fvLXDdJ3UqnylH
 5kMDvT6ALQOQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 19:20:25 -0700
IronPort-SDR: cMY/WQkXVnG+KWOuFZyDMejGW1TkRM5uGqfAkMqAC6PaVLZflQEng6YRW0y8JFCdUyVjklY3fH
 3SsCLrPZjqYA==
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; 
 d="scan'208,217";a="442768594"
Received: from palanisa-mobl.gar.corp.intel.com (HELO [10.215.184.183])
 ([10.215.184.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 19:20:24 -0700
Subject: Re: openbmc Digest, Vol 57, Issue 104
To: openbmc@lists.ozlabs.org, zhouyuanqing8@outlook.com, vijaykhemka@fb.com
References: <mailman.1200.1590614142.6940.openbmc@lists.ozlabs.org>
From: "Palanisamy, Saravanan" <saravanan.palanisamy@linux.intel.com>
Message-ID: <1db1e4b8-b73a-1006-bf40-65488171e0fe@linux.intel.com>
Date: Thu, 28 May 2020 07:50:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <mailman.1200.1590614142.6940.openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative;
 boundary="------------3F92746073A5A9F047CCA765"
Content-Language: en-US
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

This is a multi-part message in MIME format.
--------------3F92746073A5A9F047CCA765
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Harley,

     And if you are using intel basebaoard, it will show in 'ipmitool 
fru' as well with this change:

https://gerrit.openbmc-project.xyz/#/c/openbmc/intel-ipmi-oem/+/31980/


Regards,

Saravanan

On 5/28/2020 2:45 AM, openbmc-request@lists.ozlabs.org wrote:
> Send openbmc mailing list submissions to
> 	openbmc@lists.ozlabs.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
> 	https://lists.ozlabs.org/listinfo/openbmc
> or, via email, send a message with subject or body 'help' to
> 	openbmc-request@lists.ozlabs.org
>
> You can reach the person managing the list at
> 	openbmc-owner@lists.ozlabs.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of openbmc digest..."
>
> Today's Topics:
>
> 	   1. Re: ??: About FRU (Vijay Khemka)

--------------3F92746073A5A9F047CCA765
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p>Hi Harley,</p>
    <p>    And if you are using intel basebaoard, it will show in
      'ipmitool fru' as well with this change:<br>
    </p>
    <p><a
href="https://gerrit.openbmc-project.xyz/#/c/openbmc/intel-ipmi-oem/+/31980/">https://gerrit.openbmc-project.xyz/#/c/openbmc/intel-ipmi-oem/+/31980/</a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Saravanan</p>
    <div class="moz-cite-prefix">On 5/28/2020 2:45 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:openbmc-request@lists.ozlabs.org">openbmc-request@lists.ozlabs.org</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:mailman.1200.1590614142.6940.openbmc@lists.ozlabs.org">
      <pre class="moz-quote-pre" wrap="">Send openbmc mailing list submissions to
	<a class="moz-txt-link-abbreviated" href="mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>

To subscribe or unsubscribe via the World Wide Web, visit
	<a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listinfo/openbmc</a>
or, via email, send a message with subject or body 'help' to
	<a class="moz-txt-link-abbreviated" href="mailto:openbmc-request@lists.ozlabs.org">openbmc-request@lists.ozlabs.org</a>

You can reach the person managing the list at
	<a class="moz-txt-link-abbreviated" href="mailto:openbmc-owner@lists.ozlabs.org">openbmc-owner@lists.ozlabs.org</a>

When replying, please edit your Subject line so it is more specific
than "Re: Contents of openbmc digest..."
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">Today's Topics:

	   1. Re: ??: About FRU (Vijay Khemka)
</pre>
    </blockquote>
  </body>
</html>

--------------3F92746073A5A9F047CCA765--
