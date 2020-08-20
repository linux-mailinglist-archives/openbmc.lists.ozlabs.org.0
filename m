Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A14A24C075
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 16:20:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXRcl36mFzDr3f
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 00:20:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Xb06KSIz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXRZY2v11zDr3X
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 00:18:12 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07KE28xP122151; Thu, 20 Aug 2020 10:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type; s=pp1; bh=oeNu2VIV+Df1Yuqcc08Y5XfsdebGeFsdApeQSr8Rwaw=;
 b=Xb06KSIzuJvCuH3CMUBfvNhQInW4eEatD4Vtx2W5nA4uF1moSqTApjGAYHrFq7GGeQgX
 NnvpFDuHqefdlhvXiSiaQV9wK1iosj8o43kGtcWRMNZkDXl6+xLKkMT3IcHci+hWXNC+
 8g6+az98CvxIEVVdjP6DD6Rk9m0sXUVWcPAbi4tex3FEIHhCug0my93wiufVFBRkd2O9
 ++V9djNbSMbGDC5jCT5fiugCWqsURmQeVXVfc2MEu7+U/2NTUmNKjXwK0f1FfOQBcZJd
 MRWO3w3nFH2GRtqZTY/bjoDWVgArx+cPsDol5ID1hbCD5UKKEzmbjGyrj/Ys42+c71vL oQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3313aq1qht-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 10:18:08 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07KEFbt0029867;
 Thu, 20 Aug 2020 14:18:07 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3304cd20kc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 14:18:07 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07KEI6gP000582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Aug 2020 14:18:06 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47D2A6E04C;
 Thu, 20 Aug 2020 14:18:06 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C8F16E04E;
 Thu, 20 Aug 2020 14:18:04 +0000 (GMT)
Received: from [9.81.217.156] (unknown [9.81.217.156])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 20 Aug 2020 14:18:03 +0000 (GMT)
Subject: Re: webui-vue first impressions
To: Ed Tanous <ed@tanous.net>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Message-ID: <ac6a1c05-19fe-8437-ce50-c35ce88f19a1@linux.vnet.ibm.com>
Date: Thu, 20 Aug 2020 08:18:02 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------4DE73BD6D349DB1AA74EC1C8"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-20_03:2020-08-19,
 2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008200113
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
--------------4DE73BD6D349DB1AA74EC1C8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/17/2020 11:34 AM, Ed Tanous wrote:
> "Ed, what would it take for you to switch to using webui-vue?"

Hi Ed,

Thank you for your feedback.


> What follows is my first impressions on an answer:
>
> 1. size parity with phosphor-webui.
> On the current master, webui-vue has a 40% larger binary footprint
> (614kb vs 440kb) and is still missing features that will add size.
> Lots of bmcs run on 32MB of flash, so every kb matters, even if it
> doesn't matter for the newer platforms with eMMC or larger SPI flash.
> webui-vue needs to sort out where that extra heft came from, and
> eradicate it.
It was smaller than phosphor-webuiuntil recently.
https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/35696
<https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/35696>Gets us 
back under the size of phosphor-webui.
If we care about flash,we should look at removing or reducing the size of
76.0K   /usr/share/www/DMTF_Redfish_logo_2017.svg


> 2. A more thorough list of deficiencies in comparison to phosphor-webui.
> There's a "feature parity" list on the readme that makes it seem like
> it's closer than it is in practice.  In the course of writing the
> patchset above I found that webui-vue doesn't support Mutual TLS,
> doesn't support CSRF allow list (a security feature), and doesn't
> support the "next" url forward.  None of these are listed in the
> feature parity list.  Considering that's just what I found in the
> initial look for the above patchset, I'm guessing there's more use
> cases that got overlooked.  If we're dropping use cases, we need to be
> explicit about it, and document why.
Yeah, we clearly missed some features that were in phosphor-webuiwith 
the rewrite. I opened some issues for these and the others we know 
about. IBM will work onthe "next" URL forward. For features implemented 
in phosphor-webuithat we don’t plan to support will need to 
reimplemented by the community in webui-vuebut I don’t think there 
should be many and for joining us on webui-vueyou get a theme-able, 
translatable, fully Redfish, and actively developed GUI. 😊

Can you further explain what CSRF allow list feature we had in 
phosphor-webui?


> 3. Chunked payloads
> While Phosphor-webui opted for a single, very large javascript bundle,
> webui-vue opts for multiple chunked bundles.  In phosphor, this single
> bundle was done on purpose.  Chunking works great for CDNs and
> multithreaded webservers, but tends to cause slower page loads when
> done on a bmc, as bmcweb is largely optimized for single connection
> single client single request.  Although it's able to handle multiple
> clients and multiple connections, the bmc NIC tends to get "starved"
> of bandwidth for other things, which can cause performance degradation
> if you have lots of things going on in parallel.  I'd recommend going
> back to the old paradigm, unless there's a good reason to chunk from
> the BMC.  Note the bmcweb router holds all static routes in memory
> under the assumption that there won't be very many of them.  With
> chunking, that's no longer true, and probably causes some unnecessary
> increased memory usage.
After some discussion, we agree and 
https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/35696moves us 
to a single, large javascriptbundle. This should have the same number of 
js, html, and cssfiles as phoshor-webui.


> 4. A more stable migration strategy
> The changeover to vue got started completely from scratch, and got
> mixed with DOM changes that functionally changed the UI.  If this was
> to learn vue, and build a toy UI, that would've been fine, but the
> fact that it's now its own full repo means we have fork problems, give
> that there is no stable and specified bmcweb->phosphor-webui
> interface.  It would've been relatively straightforward to move
> phosphor-webui over to vue, by keeping the existing DOM, CSS, and
> layout, while replacing the templating and router with vue, but the
> decision was start over completely from scratch, and now openbmc has 2
> "official" webuis.  I probably missed the discussion on why a hard
> throwaway was needed here, but it seems like a series of patches that
> ONLY moved over to vue would've been much easier to manage here for
> the community as a whole, as each step of the way we can verify
> feature parity when reviewing patchsets.
In theory but we don’t think it would have been straightforward. Had we 
gone with a transition it would have forced all users into this 
vuerewrite, potentially some in-between larger GUI while it was in 
transition. Phosphor-webuisuffers from some anti-patterns (some of the 
reason why it took such crazy large commits to do any theming), we don’t 
think we could have reached where we are today with a transition approach.

A separate repo we felt was the safest bet. This two repo approach 
doesn’t limit the community from moving forward as the webui-vueis 
maturing. This approach has been used in the community before.
https://lists.ozlabs.org/pipermail/openbmc/2020-January/020205.html


>   As is (ignoring Kathys
> patches for a moment) there are 4 patchsets open for phosphor-webui.
> Is there a documented strategy for who is responsible for moving them
> over to webui-vue?  I didn't see anything written down, which leads me
> to believe there's no plan.
After “ignoring Kathyspatches”, I don’t see any other commit except your 
“Add the option to use backend login routines”, that isn’t up for review 
(Virtual Media) or already in (“Relace node-sass with dart-sass" and 
“expired password”) webui-vue.
https://gerrit.openbmc-project.xyz/q/project:openbmc%252Fphosphor-webui+status:open

As mentioned, we know we are missing some feature parity and are looking 
for help from the community (raising any problems or contributing) but 
we have done a lot of work to get where we are, every page on the 
existing webuiexcept SNMP and Virtual Media is in webui-vueand 
webui-vuehas a lot of advantages.

IBM has moved 2 of their systems to webui-vue

https://github.com/openbmc/openbmc/commit/4a3fa4d6d865b46ba54f2652c82f58a406455ebc

> 5. Missed opportunity with Redfish UI
> If you're going to build a redfish first GUI, it seems like an
> opportunity where we could've used the CSDL definitions to drive and
> build a lot of the UI automatically.  Given that phosphor-webui
> doesn't do this today, this wouldn't have kept me from using
> webui-vue, but the idea that the UI can simply build itself for the
> "easy" stuff would be a massive win on productivity, and would
> probably make me more personally inclined to go help sort out 1-4
> above, as I think the end would justify the means.  As is, it takes a
> very similar "hardcode every page" approach that the phosphor-webui
> did.

We don’t see how we could reasonably do this. Would need more discussion 
around this.
We also think there would be some trade-offs e.g. those Redfish Schemas 
are quiet large and today are really only needed for Redfish validation, 
using them in the GUI puts another requirement on them.

> Don't get me wrong here, I think all of the above can be fixed, and we
> certainly could have a great Vue based webui that works for everyone,
> but right now, the rather arbitrary "the project will stop supporting
> on angularjs on X date" doesn't ring that important to me.  Javascript
> frameworks and modules go unsupported all the time, and we're using
> several "unsupported" modules today to no ill effect.
We disagree some, we do think there is ill effect of being on an 
unsupported JavaScript framework. Vue has new features released 
regularly and has an active community.


> Theming is a
> nice feature, but those are mostly DOM and CSS changes, and are
> unrelated to a changeover to Vue.  Translations was attempted in
> phosphor-webui in the past, but to quote the review:
>
> "neither any clients nor any companies wanted OpenBMC translated."
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/17582
IBM does have a requirement on translation and we have heard in the GUI 
workgroup meeting, other companies would be interested in translation as 
well.


> Also keep in mind, I have very little seat time in webui-vue, the
> above is mostly first impressions in response to the ask from Gunnar.
> Overall, if the above can be fixed, I'd probably move to webui-vue.
>
> Thanks,
>
> -Ed

Appreciate the feedback, was really helpful.

Gunnar, Yoshie, and Derick



--------------4DE73BD6D349DB1AA74EC1C8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 8/17/2020 11:34 AM, Ed Tanous wrote:
    </div>
    <blockquote type="cite"
cite="mid:CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
"Ed, what would it take for you to switch to using webui-vue?"</pre>
    </blockquote>
    <br>
    <span data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW55178573 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW55178573 BCX2" style="background-color:
        inherit;"><span data-contrast="auto" style="font-size: 12pt;
          line-height: 20.5042px;" class="TextRun SCXW112587793 BCX2"
          lang="EN-US"><span class="NormalTextRun SCXW112587793 BCX2"
            style="background-color: inherit;">Hi Ed, </span></span></span></span><br>
    <span data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW55178573 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW55178573 BCX2" style="background-color:
        inherit;"></span></span><br>
    <span data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW55178573 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW55178573 BCX2" style="background-color:
        inherit;">Thank you for your feedback.</span></span>
    <p><span data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW55178573 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW55178573 BCX2"
          style="background-color: inherit;"><br>
        </span></span></p>
    <p><span data-contrast="auto" style="font-size: 12pt; font-family:
        Calibri, Calibri_MSFontService, sans-serif; line-height:
        20.5042px;" class="TextRun SCXW55178573 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW55178573 BCX2"
          style="background-color: inherit;"></span></span>
    </p>
    <blockquote type="cite"
cite="mid:CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">What follows is my first impressions on an answer:

1. size parity with phosphor-webui.
On the current master, webui-vue has a 40% larger binary footprint
(614kb vs 440kb) and is still missing features that will add size.
Lots of bmcs run on 32MB of flash, so every kb matters, even if it
doesn't matter for the newer platforms with eMMC or larger SPI flash.
webui-vue needs to sort out where that extra heft came from, and
eradicate it.</pre>
    </blockquote>
    <span data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW70164443 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW70164443 BCX2" style="background-color:
        inherit;">It was smaller than phosphor-</span></span><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW70164443 BCX2" lang="EN-US"><span
        class="SpellingError SCXW70164443 BCX2" style="background-color:
        inherit;">webui</span></span><span data-contrast="auto"
      style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
      SCXW70164443 BCX2" lang="EN-US"><span class="NormalTextRun
        SCXW70164443 BCX2" style="background-color: inherit;"> until
        recently. </span></span><span class="LineBreakBlob BlobObject
      DragDrop SCXW70164443 BCX2" style="font-size: 12pt; line-height:
      20.5042px;"><span class="SCXW70164443 BCX2"> </span></span><br
      class="SCXW70164443 BCX2">
    <span class="LineBreakBlob BlobObject DragDrop SCXW70164443 BCX2"
      style="font-size: 12pt; line-height: 20.5042px;"></span><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun EmptyTextRun SCXW70164443 BCX2"></span><a
      class="Hyperlink SCXW70164443 BCX2" style="text-decoration: none;
      color: inherit;"
      href="https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/35696"
      target="_blank" rel="noreferrer noopener"><span style="color:
        rgb(5, 99, 193); text-decoration: underline; font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        Underlined SCXW70164443 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW70164443 BCX2"
          style="background-color: inherit;"
          data-ccp-charstyle="Hyperlink">https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/35696</span></span><span
        class="LineBreakBlob BlobObject DragDrop SCXW70164443 BCX2"
        style="font-size: 12pt; line-height: 20.5042px; color: rgb(5,
        99, 193);"><span class="SCXW70164443 BCX2"> </span></span></a><br
      class="SCXW70164443 BCX2">
    <a class="Hyperlink SCXW70164443 BCX2" style="text-decoration: none;
      color: inherit;"
      href="https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/35696"
      target="_blank" rel="noreferrer noopener"><span
        class="LineBreakBlob BlobObject DragDrop SCXW70164443 BCX2"
        style="font-size: 12pt; line-height: 20.5042px; color: rgb(5,
        99, 193);"></span></a><span data-contrast="auto"
      style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
      SCXW70164443 BCX2" lang="EN-US"><span class="NormalTextRun
        SCXW70164443 BCX2" style="background-color: inherit;">Gets us
        back under the size of phosphor-</span><span
        class="SpellingError SCXW70164443 BCX2" style="background-color:
        inherit;">webui</span><span class="NormalTextRun SCXW70164443
        BCX2" style="background-color: inherit;">.</span></span><span
      class="LineBreakBlob BlobObject DragDrop SCXW70164443 BCX2"
      style="font-size: 12pt; line-height: 20.5042px;"><span
        class="SCXW70164443 BCX2"> </span></span><br class="SCXW70164443
      BCX2">
    <span class="LineBreakBlob BlobObject DragDrop SCXW70164443 BCX2"
      style="font-size: 12pt; line-height: 20.5042px;"></span><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun EmptyTextRun SCXW70164443 BCX2"
      lang="EN-US"></span><span class="EOP SCXW70164443 BCX2"
      style="font-size: 12pt; line-height: 20.5042px;"
      data-ccp-props="{}"> </span>
    <div class="OutlineElement Ltr BCX2 SCXW70164443" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW70164443 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW70164443 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted">If we care about flash,</span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW70164443 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW70164443 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted"> we should look at removing or reducing the size
          of</span></span><span class="LineBreakBlob BlobObject DragDrop
        SCXW70164443 BCX2" style="font-size: 12pt; line-height:
        20.5042px;"><span class="SCXW70164443 BCX2"> </span></span><br
        class="SCXW70164443 BCX2">
      <span class="LineBreakBlob BlobObject DragDrop SCXW70164443 BCX2"
        style="font-size: 12pt; line-height: 20.5042px;"></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW70164443 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW70164443 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted">76.0K   /</span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW70164443 BCX2" lang="EN-US"><span
          class="SpellingError SCXW70164443 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted">usr</span></span><span data-contrast="auto"
        style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
        SCXW70164443 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW70164443 BCX2" style="background-color: inherit;"
          data-ccp-parastyle="HTML Preformatted">/share/www/DMTF_Redfish_logo_2017.svg</span></span><span
        class="EOP SCXW70164443 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; font-family: Calibri,
        Calibri_MSFontService, sans-serif;"
data-ccp-props="{&quot;469777462&quot;:[916,1832,2748,3664,4580,5496,6412,7328,8244,9160,10076,10992,11908,12824,13740,14656],&quot;469777927&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],&quot;469777928&quot;:[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]}">
      </span><br>
      <span class="EOP SCXW70164443 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; font-family: Calibri,
        Calibri_MSFontService, sans-serif;"
data-ccp-props="{&quot;469777462&quot;:[916,1832,2748,3664,4580,5496,6412,7328,8244,9160,10076,10992,11908,12824,13740,14656],&quot;469777927&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],&quot;469777928&quot;:[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]}"></span>
      <p class="Paragraph SCXW70164443 BCX2" style="font-weight: normal;
        font-style: normal; vertical-align: baseline; background-color:
        transparent; color: windowtext; text-align: left; margin-left:
        0px; margin-right: 0px; padding-left: 0px; padding-right: 0px;
        text-indent: 0px;"><span class="EOP SCXW70164443 BCX2"
          style="font-size: 12pt; line-height: 20.5042px; font-family:
          Calibri, Calibri_MSFontService, sans-serif;"
data-ccp-props="{&quot;469777462&quot;:[916,1832,2748,3664,4580,5496,6412,7328,8244,9160,10076,10992,11908,12824,13740,14656],&quot;469777927&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],&quot;469777928&quot;:[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]}"><br>
        </span></p>
    </div>
    <blockquote type="cite"
cite="mid:CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">2. A more thorough list of deficiencies in comparison to phosphor-webui.
There's a "feature parity" list on the readme that makes it seem like
it's closer than it is in practice.  In the course of writing the
patchset above I found that webui-vue doesn't support Mutual TLS,
doesn't support CSRF allow list (a security feature), and doesn't
support the "next" url forward.  None of these are listed in the
feature parity list.  Considering that's just what I found in the
initial look for the above patchset, I'm guessing there's more use
cases that got overlooked.  If we're dropping use cases, we need to be
explicit about it, and document why.</pre>
    </blockquote>
    <span data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW223741068 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW223741068 BCX2"
        style="background-color: inherit;" data-ccp-parastyle="HTML
        Preformatted">Yeah, we clearly missed some features that were in
        phosphor-</span></span><span data-contrast="auto"
      style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
      SCXW223741068 BCX2" lang="EN-US"><span class="SpellingError
        SCXW223741068 BCX2" style="background-color: inherit;"
        data-ccp-parastyle="HTML Preformatted">webui</span></span><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW223741068 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW223741068 BCX2"
        style="background-color: inherit;" data-ccp-parastyle="HTML
        Preformatted"> with the rewrite. I opened some issues for these
        and the others we know about. IBM will work on</span></span><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW223741068 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW223741068 BCX2"
        style="background-color: inherit;" data-ccp-parastyle="HTML
        Preformatted"> the "next" URL forward. For features implemented
        in phosphor-</span></span><span data-contrast="auto"
      style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
      SCXW223741068 BCX2" lang="EN-US"><span class="SpellingError
        SCXW223741068 BCX2" style="background-color: inherit;"
        data-ccp-parastyle="HTML Preformatted">webui</span></span><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW223741068 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW223741068 BCX2"
        style="background-color: inherit;" data-ccp-parastyle="HTML
        Preformatted"> that we don’t plan to support will need to
        reimplemented by the community in </span></span><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW223741068 BCX2" lang="EN-US"><span
        class="SpellingError SCXW223741068 BCX2"
        style="background-color: inherit;" data-ccp-parastyle="HTML
        Preformatted">webui-vue</span></span><span data-contrast="auto"
      style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
      SCXW223741068 BCX2" lang="EN-US"><span class="NormalTextRun
        SCXW223741068 BCX2" style="background-color: inherit;"
        data-ccp-parastyle="HTML Preformatted"> but I don’t think there
        should be many and for joining us on </span></span><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW223741068 BCX2" lang="EN-US"><span
        class="SpellingError SCXW223741068 BCX2"
        style="background-color: inherit;" data-ccp-parastyle="HTML
        Preformatted">webui-vue</span></span><span data-contrast="auto"
      style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
      SCXW223741068 BCX2" lang="EN-US"><span class="NormalTextRun
        SCXW223741068 BCX2" style="background-color: inherit;"
        data-ccp-parastyle="HTML Preformatted"> you get a </span><span
        class="SpellingError SCXW223741068 BCX2"
        style="background-color: inherit;" data-ccp-parastyle="HTML
        Preformatted">theme-able</span><span class="NormalTextRun
        SCXW223741068 BCX2" style="background-color: inherit;"
        data-ccp-parastyle="HTML Preformatted">, translatable, fully
        Redfish, and actively developed GUI. </span></span><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW223741068 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW223741068 BCX2"
        style="background-color: inherit;" data-ccp-parastyle="HTML
        Preformatted">😊<br>
      </span></span><br>
    <span data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW223741068 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW223741068 BCX2"
        style="background-color: inherit;" data-ccp-parastyle="HTML
        Preformatted">Can you further explain what CSRF allow list
        feature we had in phosphor-webui?</span></span>
    <p><span data-contrast="auto" style="font-size: 12pt; font-family:
        Segoe UI Emoji, Segoe UI Emoji_MSFontService, sans-serif;
        line-height: 20.5042px;" class="TextRun SCXW223741068 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW223741068 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted"><br>
        </span></span></p>
    <span data-contrast="auto" style="font-size: 12pt; font-family:
      Segoe UI Emoji, Segoe UI Emoji_MSFontService, sans-serif;
      line-height: 20.5042px;" class="TextRun SCXW223741068 BCX2"
      lang="EN-US"><span class="NormalTextRun SCXW223741068 BCX2"
        style="background-color: inherit;" data-ccp-parastyle="HTML
        Preformatted"></span></span>
    <blockquote type="cite"
cite="mid:CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">3. Chunked payloads
While Phosphor-webui opted for a single, very large javascript bundle,
webui-vue opts for multiple chunked bundles.  In phosphor, this single
bundle was done on purpose.  Chunking works great for CDNs and
multithreaded webservers, but tends to cause slower page loads when
done on a bmc, as bmcweb is largely optimized for single connection
single client single request.  Although it's able to handle multiple
clients and multiple connections, the bmc NIC tends to get "starved"
of bandwidth for other things, which can cause performance degradation
if you have lots of things going on in parallel.  I'd recommend going
back to the old paradigm, unless there's a good reason to chunk from
the BMC.  Note the bmcweb router holds all static routes in memory
under the assumption that there won't be very many of them.  With
chunking, that's no longer true, and probably causes some unnecessary
increased memory usage.</pre>
    </blockquote>
    <span data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW68329248 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW68329248 BCX2" style="background-color:
        inherit;" data-ccp-parastyle="HTML Preformatted">After some
        discussion, we agree and </span></span><a class="Hyperlink
      SCXW68329248 BCX2" style="text-decoration: none; color: inherit;"
href="https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/35696"
      target="_blank" rel="noreferrer noopener"><span style="color:
        rgb(5, 99, 193); text-decoration: underline; font-size: 12pt;
        line-height: 20.5042px;" data-contrast="none" class="TextRun
        Underlined SCXW68329248 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW68329248 BCX2"
          style="background-color: inherit;"
          data-ccp-charstyle="Hyperlink">https://gerrit.openbmc-project.xyz/c/openbmc/webui-vue/+/35696</span></span></a><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW68329248 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW68329248 BCX2" style="background-color:
        inherit;" data-ccp-parastyle="HTML Preformatted"> moves us to a
        single, large </span></span><span data-contrast="auto"
      style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
      SCXW68329248 BCX2" lang="EN-US"><span class="SpellingError
        SCXW68329248 BCX2" style="background-color: inherit;"
        data-ccp-parastyle="HTML Preformatted">javascript</span></span><span
      data-contrast="auto" style="font-size: 12pt; line-height:
      20.5042px;" class="TextRun SCXW68329248 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW68329248 BCX2" style="background-color:
        inherit;" data-ccp-parastyle="HTML Preformatted"> bundle. This
        should have the same number of </span><span
        class="SpellingError SCXW68329248 BCX2" style="background-color:
        inherit;" data-ccp-parastyle="HTML Preformatted">js</span><span
        class="NormalTextRun SCXW68329248 BCX2" style="background-color:
        inherit;" data-ccp-parastyle="HTML Preformatted">, html, and </span><span
        class="SpellingError SCXW68329248 BCX2" style="background-color:
        inherit;" data-ccp-parastyle="HTML Preformatted">css</span><span
        class="NormalTextRun SCXW68329248 BCX2" style="background-color:
        inherit;" data-ccp-parastyle="HTML Preformatted"> files as </span><span
        class="SpellingError SCXW68329248 BCX2" style="background-color:
        inherit;" data-ccp-parastyle="HTML Preformatted">phoshor-webui</span><span
        class="NormalTextRun SCXW68329248 BCX2" style="background-color:
        inherit;" data-ccp-parastyle="HTML Preformatted">.</span></span>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">4. A more stable migration strategy
The changeover to vue got started completely from scratch, and got
mixed with DOM changes that functionally changed the UI.  If this was
to learn vue, and build a toy UI, that would've been fine, but the
fact that it's now its own full repo means we have fork problems, give
that there is no stable and specified bmcweb-&gt;phosphor-webui
interface.  It would've been relatively straightforward to move
phosphor-webui over to vue, by keeping the existing DOM, CSS, and
layout, while replacing the templating and router with vue, but the
decision was start over completely from scratch, and now openbmc has 2
"official" webuis.  I probably missed the discussion on why a hard
throwaway was needed here, but it seems like a series of patches that
ONLY moved over to vue would've been much easier to manage here for
the community as a whole, as each step of the way we can verify
feature parity when reviewing patchsets. </pre>
    </blockquote>
    <div class="OutlineElement Ltr BCX2 SCXW198745046" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW198745046 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW198745046 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted">In theory but we don’t think it would have been
          straightforward. </span></span><span data-contrast="auto"
        style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
        SCXW198745046 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW198745046 BCX2" style="background-color: inherit;"
          data-ccp-parastyle="HTML Preformatted">Had we gone with a
          transition it would have forced all users into this </span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW198745046 BCX2" lang="EN-US"><span
          class="SpellingError SCXW198745046 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted">vue</span></span><span data-contrast="auto"
        style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
        SCXW198745046 BCX2" lang="EN-US"><span class="NormalTextRun
          SCXW198745046 BCX2" style="background-color: inherit;"
          data-ccp-parastyle="HTML Preformatted"> rewrite, potentially
          some in-between larger GUI while it was in transition.
          Phosphor-</span></span><span data-contrast="auto"
        style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
        SCXW198745046 BCX2" lang="EN-US"><span class="SpellingError
          SCXW198745046 BCX2" style="background-color: inherit;"
          data-ccp-parastyle="HTML Preformatted">webui</span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW198745046 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW198745046 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted"> suffers from some anti-patterns (some of the
          reason why it took such crazy large commits to do any
          theming), we don’t think we could have reached where we are
          today with a transition approach. </span></span><span
        class="EOP SCXW198745046 BCX2" style="font-size: 12pt;
        line-height: 20.5042px;"
data-ccp-props="{&quot;469777462&quot;:[916,1832,2748,3664,4580,5496,6412,7328,8244,9160,10076,10992,11908,12824,13740,14656],&quot;469777927&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],&quot;469777928&quot;:[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]}"> </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW198745046" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW198745046 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW198745046 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted"> </span></span><span class="LineBreakBlob
        BlobObject DragDrop SCXW198745046 BCX2" style="font-size: 12pt;
        line-height: 20.5042px;"><span class="SCXW198745046 BCX2"> </span><br
          class="SCXW198745046 BCX2">
      </span><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW198745046 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW198745046 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted">A separate repo we felt was the safest bet. This
          two repo approach doesn’t limit the community from moving
          forward as the </span></span><span data-contrast="auto"
        style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
        SCXW198745046 BCX2" lang="EN-US"><span class="SpellingError
          SCXW198745046 BCX2" style="background-color: inherit;"
          data-ccp-parastyle="HTML Preformatted">webui-vue</span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW198745046 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW198745046 BCX2"
          style="background-color: inherit;" data-ccp-parastyle="HTML
          Preformatted"> is maturing. This approach has been used in the
          community before.  </span></span><span class="LineBreakBlob
        BlobObject DragDrop SCXW198745046 BCX2" style="font-size: 12pt;
        line-height: 20.5042px;"><span class="SCXW198745046 BCX2"> </span><br
          class="SCXW198745046 BCX2">
      </span><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun EmptyTextRun
        SCXW198745046 BCX2" lang="EN-US"></span><span class="EOP
        SCXW198745046 BCX2" style="font-size: 12pt; line-height:
        20.5042px;"
data-ccp-props="{&quot;469777462&quot;:[916,1832,2748,3664,4580,5496,6412,7328,8244,9160,10076,10992,11908,12824,13740,14656],&quot;469777927&quot;:[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],&quot;469777928&quot;:[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]}"> </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW198745046" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun EmptyTextRun
        SCXW198745046 BCX2"></span><a class="Hyperlink SCXW198745046
        BCX2" style="text-decoration: none; color: inherit;"
href="https://lists.ozlabs.org/pipermail/openbmc/2020-January/020205.html"
        target="_blank" rel="noreferrer noopener"><span style="color:
          rgb(5, 99, 193); text-decoration: underline; font-size: 12pt;
          line-height: 20.5042px;" data-contrast="none" class="TextRun
          Underlined SCXW198745046 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW198745046 BCX2"
            style="background-color: inherit;"
            data-ccp-charstyle="Hyperlink">https://lists.ozlabs.org/pipermail/openbmc/2020-January/020205.html</span></span></a><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun EmptyTextRun SCXW198745046 BCX2"
        lang="EN-US"></span><span class="EOP SCXW198745046 BCX2"
        style="font-size: 12pt; line-height: 20.5042px;"
        data-ccp-props="{}"> <br>
      </span></div>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap=""> As is (ignoring Kathys
patches for a moment) there are 4 patchsets open for phosphor-webui.
Is there a documented strategy for who is responsible for moving them
over to webui-vue?  I didn't see anything written down, which leads me
to believe there's no plan.</pre>
    </blockquote>
    <div class="OutlineElement Ltr BCX2 SCXW36054189" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW36054189 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW36054189 BCX2"
          style="background-color: inherit;">After “ignoring Kathys</span></span><span
        class="LineBreakBlob BlobObject DragDrop SCXW36054189 BCX2"
        style="font-size: 12pt; line-height: 20.5042px;"><span
          class="SCXW36054189 BCX2"> </span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW36054189 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW36054189 BCX2"
          style="background-color: inherit;">patches”, I don’t see any
          other commit except your “Add the option to use backend login
          routines”, that isn’t up for review (Virtual Media) or already
          in (“Relace node-sass with dart-sass" and “expired password”)
        </span></span><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW36054189 BCX2"
        lang="EN-US"><span class="SpellingError SCXW36054189 BCX2"
          style="background-color: inherit;">webui-vue</span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW36054189 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW36054189 BCX2"
          style="background-color: inherit;">. </span></span><span
        class="EOP SCXW36054189 BCX2" style="font-size: 12pt;
        line-height: 20.5042px;" data-ccp-props="{}"> <br>
      </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW36054189" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun EmptyTextRun
        SCXW36054189 BCX2"></span><a class="Hyperlink SCXW36054189 BCX2"
        style="text-decoration: none; color: inherit;"
href="https://gerrit.openbmc-project.xyz/q/project:openbmc%252Fphosphor-webui+status:open"
        target="_blank" rel="noreferrer noopener"><span style="color:
          rgb(5, 99, 193); text-decoration: underline; font-size: 12pt;
          line-height: 20.5042px;" data-contrast="none" class="TextRun
          Underlined SCXW36054189 BCX2" lang="EN-US"><span
            class="NormalTextRun SCXW36054189 BCX2"
            style="background-color: inherit;"
            data-ccp-charstyle="Hyperlink">https://gerrit.openbmc-project.xyz/q/project:openbmc%252Fphosphor-webui+status:open</span></span></a><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW36054189 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW36054189 BCX2"
          style="background-color: inherit;"> </span></span><span
        class="EOP SCXW36054189 BCX2" style="font-size: 12pt;
        line-height: 20.5042px;" data-ccp-props="{}"> </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW36054189" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun EmptyTextRun
        SCXW36054189 BCX2" lang="EN-US"></span><span
        class="LineBreakBlob BlobObject DragDrop SCXW36054189 BCX2"
        style="font-size: 12pt; line-height: 20.5042px;"><span
          class="SCXW36054189 BCX2"> </span><br class="SCXW36054189
          BCX2">
      </span><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW36054189 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW36054189 BCX2"
          style="background-color: inherit;">As mentioned, we know we
          are missing some feature parity and are looking for help from
          the community (raising any problems or contributing) but we
          have done a lot of work to get where we are, every page on the
          existing </span></span><span data-contrast="auto"
        style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
        SCXW36054189 BCX2" lang="EN-US"><span class="SpellingError
          SCXW36054189 BCX2" style="background-color: inherit;">webui</span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW36054189 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW36054189 BCX2"
          style="background-color: inherit;"> except SNMP and Virtual
          Media is in </span></span><span data-contrast="auto"
        style="font-size: 12pt; line-height: 20.5042px;" class="TextRun
        SCXW36054189 BCX2" lang="EN-US"><span class="SpellingError
          SCXW36054189 BCX2" style="background-color: inherit;">webui-vue</span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW36054189 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW36054189 BCX2"
          style="background-color: inherit;"> and </span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW36054189 BCX2" lang="EN-US"><span
          class="SpellingError SCXW36054189 BCX2"
          style="background-color: inherit;">webui-vue</span></span><span
        data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW36054189 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW36054189 BCX2"
          style="background-color: inherit;"> has a lot of advantages. </span></span><span
        class="EOP SCXW36054189 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; font-family: Calibri,
        Calibri_MSFontService, sans-serif;" data-ccp-props="{}"> <br>
      </span></div>
    <div class="OutlineElement Ltr BCX2 SCXW36054189" style="direction:
      ltr;"><span class="EOP SCXW36054189 BCX2" style="font-size: 12pt;
        line-height: 20.5042px; font-family: Calibri,
        Calibri_MSFontService, sans-serif;" data-ccp-props="{}"><br>
        IBM has moved 2 of their systems to webui-vue<br>
        <br>
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/openbmc/commit/4a3fa4d6d865b46ba54f2652c82f58a406455ebc">https://github.com/openbmc/openbmc/commit/4a3fa4d6d865b46ba54f2652c82f58a406455ebc</a><br>
        <br>
      </span></div>
    <p>
    </p>
    <blockquote type="cite"
cite="mid:CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">5. Missed opportunity with Redfish UI
If you're going to build a redfish first GUI, it seems like an
opportunity where we could've used the CSDL definitions to drive and
build a lot of the UI automatically.  Given that phosphor-webui
doesn't do this today, this wouldn't have kept me from using
webui-vue, but the idea that the UI can simply build itself for the
"easy" stuff would be a massive win on productivity, and would
probably make me more personally inclined to go help sort out 1-4
above, as I think the end would justify the means.  As is, it takes a
very similar "hardcode every page" approach that the phosphor-webui
did.</pre>
    </blockquote>
    <br>
    <div class="OutlineElement Ltr BCX2 SCXW101444828" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW101444828 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW101444828 BCX2"
          style="background-color: inherit;">We don’t see how we could
          reasonably do this. Would need more discussion around this. <br>
          We also think there would be some trade-offs e.g. those
          Redfish Schemas are quiet large and today are really only
          needed for Redfish validation, using them in the GUI puts
          another requirement on them.<br>
        </span></span></div>
    <div class="OutlineElement Ltr BCX2 SCXW101444828" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW101444828 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW101444828 BCX2"
          style="background-color: inherit;"><br>
        </span></span><span class="EOP SCXW101444828 BCX2"
        style="font-size: 12pt; line-height: 20.5042px; font-family:
        Arial, Arial_MSFontService, sans-serif;" data-ccp-props="{}"> </span>
    </div>
    <blockquote type="cite"
cite="mid:CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Don't get me wrong here, I think all of the above can be fixed, and we
certainly could have a great Vue based webui that works for everyone,
but right now, the rather arbitrary "the project will stop supporting
on angularjs on X date" doesn't ring that important to me.  Javascript
frameworks and modules go unsupported all the time, and we're using
several "unsupported" modules today to no ill effect. </pre>
    </blockquote>
    <div class="OutlineElement Ltr BCX2 SCXW208621347" style="direction:
      ltr;"><span data-contrast="auto" style="font-size: 12pt;
        line-height: 20.5042px;" class="TextRun SCXW208621347 BCX2"
        lang="EN-US"><span class="NormalTextRun SCXW208621347 BCX2"
          style="background-color: inherit;">We disagree some, we do
          think there is ill effect of being on an unsupported
          JavaScript framework. Vue has new features released regularly
          and has an active community.   </span></span><span class="EOP
        SCXW208621347 BCX2" style="font-size: 12pt; line-height:
        20.5042px; font-family: Calibri, Calibri_MSFontService,
        sans-serif;" data-ccp-props="{}"> <br>
      </span></div>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Theming is a
nice feature, but those are mostly DOM and CSS changes, and are
unrelated to a changeover to Vue.  Translations was attempted in
phosphor-webui in the past, but to quote the review:

"neither any clients nor any companies wanted OpenBMC translated."
<a class="moz-txt-link-freetext" href="https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/17582">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/17582</a></pre>
    </blockquote>
    <span data-contrast="auto" style="font-size: 12pt; font-family:
      Calibri, Calibri_MSFontService, sans-serif; line-height:
      20.5042px;" class="TextRun SCXW151303975 BCX2" lang="EN-US"><span
        class="NormalTextRun SCXW151303975 BCX2"
        style="background-color: inherit;">IBM does have a requirement
        on translation and we have heard in the GUI workgroup meeting,
        other companies would be interested in translation as well. <br>
      </span></span>
    <p><span data-contrast="auto" style="font-size: 12pt; font-family:
        Calibri, Calibri_MSFontService, sans-serif; line-height:
        20.5042px;" class="TextRun SCXW151303975 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW151303975 BCX2"
          style="background-color: inherit;"><br>
        </span></span></p>
    <p><span data-contrast="auto" style="font-size: 12pt; font-family:
        Calibri, Calibri_MSFontService, sans-serif; line-height:
        20.5042px;" class="TextRun SCXW151303975 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW151303975 BCX2"
          style="background-color: inherit;"></span></span></p>
    <p><span data-contrast="auto" style="font-size: 12pt; font-family:
        Calibri, Calibri_MSFontService, sans-serif; line-height:
        20.5042px;" class="TextRun SCXW151303975 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW151303975 BCX2"
          style="background-color: inherit;"></span></span>
    </p>
    <blockquote type="cite"
cite="mid:CACWQX833imTWQxB2hDvzVo5mTQzggAVEieZf4TV8mu=y2uPajA@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Also keep in mind, I have very little seat time in webui-vue, the
above is mostly first impressions in response to the ask from Gunnar.
Overall, if the above can be fixed, I'd probably move to webui-vue.

Thanks,

-Ed</pre>
    </blockquote>
    <p>Appreciate the feedback, was really helpful. <br>
      <br>
      <span data-contrast="auto" style="font-size: 12pt; line-height:
        20.5042px;" class="TextRun SCXW191667935 BCX2" lang="EN-US"><span
          class="NormalTextRun SCXW191667935 BCX2"
          style="background-color: inherit;">Gunnar, Yoshie, and Derick
        </span></span><br>
    </p>
    <br>
  </body>
</html>

--------------4DE73BD6D349DB1AA74EC1C8--

