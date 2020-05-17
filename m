Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BEB1D6639
	for <lists+openbmc@lfdr.de>; Sun, 17 May 2020 08:01:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ps326ksKzDqc1
	for <lists+openbmc@lfdr.de>; Sun, 17 May 2020 16:01:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=saravanan.palanisamy@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ps22600lzDqZm
 for <openbmc@lists.ozlabs.org>; Sun, 17 May 2020 16:00:20 +1000 (AEST)
IronPort-SDR: Vbm+wF7iX1kQDEGsmG5p5YRKkBy0W+qlHApTIC73uBMMdx9om0VjQ6s6ucc31bPQwNR5rfn/vK
 fWgB9h0Xx4bw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2020 23:00:16 -0700
IronPort-SDR: 3u4rCIZxl7kUHciV0SgVljq8OcSxIOUJC6lQ3DqkqGsECbCLWBiqUtQAiB1AmeLZFUjIwNC6Jf
 6QlGKYmfsm0g==
X-IronPort-AV: E=Sophos;i="5.73,402,1583222400"; 
 d="scan'208,217";a="438834756"
Received: from palanisa-mobl.gar.corp.intel.com (HELO [10.215.194.107])
 ([10.215.194.107])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2020 23:00:15 -0700
Subject: Re: problem trying to bitbake obmc-phosphor-image
To: gmontag@habana.ai, patrick@stwcx.xyz
References: <mailman.527.1589576900.14724.openbmc@lists.ozlabs.org>
From: "Palanisamy, Saravanan" <saravanan.palanisamy@linux.intel.com>
Message-ID: <307fae25-9b06-4cdb-0a1d-15cfb3aa7f89@linux.intel.com>
Date: Sun, 17 May 2020 11:30:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <mailman.527.1589576900.14724.openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative;
 boundary="------------1CD43A666171922A2559A3E7"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------1CD43A666171922A2559A3E7
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Montang,

     You may try run below commands to setup your github ssh 
environment, before starting your build:

     For example:

/        eval $(ssh-agent -s);//
//       ssh-add ~/.ssh/saravanan_linux_intel_github_id_rsa//
/

Thanks,

Saravanan

On 5/16/2020 2:38 AM, openbmc-request@lists.ozlabs.org wrote:
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
>     1. Re: problem trying to bitbake obmc-phosphor-image
>        (Patrick Williams)
>     2. Re: Reducing fragmentation in OpenBMC (Jae Hyun Yoo)
>     3. Re: Reducing fragmentation in OpenBMC (Vijay Khemka)
>     4. Re: phosphor-health-monitor repo (Vijay Khemka)

--------------1CD43A666171922A2559A3E7
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p>Hi Montang,</p>
    <p>    You may try run below commands to setup your github ssh
      environment, before starting your build:<br>
    </p>
    <p>    For example:</p>
    <p><i>         eval $(ssh-agent -s);</i><i><br>
      </i><i>       ssh-add ~/.ssh/saravanan_linux_intel_github_id_rsa</i><i><br>
      </i></p>
    <p>Thanks,</p>
    <p>Saravanan<br>
    </p>
    <div class="moz-cite-prefix">On 5/16/2020 2:38 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:openbmc-request@lists.ozlabs.org">openbmc-request@lists.ozlabs.org</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:mailman.527.1589576900.14724.openbmc@lists.ozlabs.org">
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

   1. Re: problem trying to bitbake obmc-phosphor-image
      (Patrick Williams)
   2. Re: Reducing fragmentation in OpenBMC (Jae Hyun Yoo)
   3. Re: Reducing fragmentation in OpenBMC (Vijay Khemka)
   4. Re: phosphor-health-monitor repo (Vijay Khemka)
</pre>
    </blockquote>
  </body>
</html>

--------------1CD43A666171922A2559A3E7--
