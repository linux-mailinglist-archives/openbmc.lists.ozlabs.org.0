Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEC319227B
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 09:20:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nLds12pvzDqXN
	for <lists+openbmc@lfdr.de>; Wed, 25 Mar 2020 19:20:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=XMQj2TNX; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nLd76tGpzDqNn
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 19:19:36 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8B9CD41268
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 08:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-language:content-type:content-type:in-reply-to
 :mime-version:user-agent:date:date:message-id:from:from
 :references:subject:subject:received:received:received; s=
 mta-01; t=1585124369; x=1586938770; bh=YpaNAQvEtlSuJbpoqH8sCd+It
 GRORST5qkI8WVEAz4U=; b=XMQj2TNXCIIvlLhoh/iTil2woRWE8AWT0CEMuf9jy
 mhBIN45SvtgHKBmhSvMZtuLsnsc5/ObA7SNDDLSThoiMvWEvfbjo/ZR8ju8NSDQV
 8/5ZE+RHNV0ZOqANYDuoybZYh9DX0t/Su7QS5KM5G3GFzXH5yWahPDK8i4AUvFPN
 AY=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JpGiXnGpt2hq for <openbmc@lists.ozlabs.org>;
 Wed, 25 Mar 2020 11:19:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B7300404CD
 for <openbmc@lists.ozlabs.org>; Wed, 25 Mar 2020 11:19:29 +0300 (MSK)
Received: from [10.199.2.106] (10.199.2.106) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 25
 Mar 2020 11:19:30 +0300
Subject: Re: Fwd: Which repo is more stable, feature complete, most
 functionality? https://github.com/openbmc/openbmc or
 https://github.com/Intel-BMC/openbmc
To: <openbmc@lists.ozlabs.org>
References: <8117ef0c5f9a4c599ebe1d53aae209b3@SCL-EXCHMB-13.phoenix.com>
 <CADy_Pt3xOgPXungY+nwpYjFVcvCqMek_gHLeFWXOUoSjLom3RQ@mail.gmail.com>
 <CADy_Pt2mZ8E4EgY0y3wRSLh080cBBmoERgJvR7Lk8Rj4ep39-w@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Message-ID: <b00d43e6-b296-a5a1-3c20-50f40bdfafd9@yadro.com>
Date: Wed, 25 Mar 2020 11:19:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CADy_Pt2mZ8E4EgY0y3wRSLh080cBBmoERgJvR7Lk8Rj4ep39-w@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------42489C4137989F85965DD8EA"
Content-Language: en-US
X-Originating-IP: [10.199.2.106]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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

--------------42489C4137989F85965DD8EA
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

James, I have to disagree.

The last time I tried (Mar 12, commit 276f647402), the openbmc/openbmc 
repo was still unable to control power of the host system on Wolfpass. 
That is why we're still using Intel-BMC/openbmc for our wolfpass-based 
board in development.

On the other hand, the Intel-BMC/openbmc repo lacks virtual media support.

We would love to use the main openbmc/openbmc for our x86 board but so 
far it just doesn't work.

Alexander.

24.03.2020 21:11, James Mihm пишет:
> I meant to include the mailing list on my response.
>
> James.
>
> ---------- Forwarded message ---------
> From: *James Mihm* <james.mihm@gmail.com <mailto:james.mihm@gmail.com>>
> Date: Mon, Mar 9, 2020 at 7:11 PM
> Subject: Re: Which repo is more stable, feature complete, most 
> functionality? https://github.com/openbmc/openbmc or 
> https://github.com/Intel-BMC/openbmc
> To: Bruce Mitchell <Bruce_Mitchell@phoenix.com 
> <mailto:Bruce_Mitchell@phoenix.com>>
>
>
> Bruce,
>
> The Intel-BMC/openbmc repo is where we (i.e., Intel) pushes our 
> internal fork externally while in the process of upstreaming. The 
> intent for this repo is for it to be functional on an Intel 
> development platform (e.g., Wolfpass) at all times while upstreaming 
> changes to the openbmc/openbmc repo. The long term goal is for Intel 
> to be pushing all development upstream to the openbmc/openbmc repo, 
> and using the Intel-BMC repository for sharing future capabilities 
> that are not yet publically announced. Where our goal is to push our 
> internal development fork to the Intel-BMC/openbmc repo every two weeks.
>
> Two exceptions for upstreaming are the webui and linux kernel patches. 
> Upstreaming the linux kernel patches is challenging and some of the 
> patches may never make it upstream. With the migration of the webui to 
> vue.js there's not much point in upstreaming the Intel fork of 
> phosphor-webui.
>
> My answer to your question is to use the openbmc/openbmc repository, 
> but not for controlling your car brakes.
>
> James.
>
>
>
> On Thu, Jan 16, 2020 at 4:27 PM Bruce Mitchell 
> <Bruce_Mitchell@phoenix.com <mailto:Bruce_Mitchell@phoenix.com>> wrote:
>
>     Which repo is more stable, feature complete, most functionality?
>     https://github.com/openbmc/openbmc or
>     https://github.com/Intel-BMC/openbmc
>
>     While the WebUI for https://github.com/Intel-BMC/openbmc may look
>     better,
>     presently its functionality for BMC operation seems intermittent
>     compared to the functionality of https://github.com/openbmc/openbmc.
>     I am referring to basic things such as displaying the BMC's
>     Firmware Version, the lack of displaying any NIC for Network
>     Settings, the "hang" for Health Hardware Status.
>
>     This is not a request about ahead or behind; I am asking about
>     stable, feature complete, most functionality.
>
>     Using a metaphor here; if you had to select today one of the 2 for
>     controlling your car's breaks which would it be?
>
>     Thank you.
>

--------------42489C4137989F85965DD8EA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>James, I have to disagree. <br>
    </p>
    <p>The last time I tried (Mar 12, commit 276f647402), the
      openbmc/openbmc repo was still unable to control power of the host
      system on Wolfpass. That is why we're still using
      Intel-BMC/openbmc for our wolfpass-based board in development.</p>
    <p>On the other hand, the Intel-BMC/openbmc repo lacks virtual media
      support.</p>
    <p>We would love to use the main openbmc/openbmc for our x86 board
      but so far it just doesn't work.<br>
    </p>
    <p>Alexander.<br>
    </p>
    <div class="moz-cite-prefix">24.03.2020 21:11, James Mihm пишет:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADy_Pt2mZ8E4EgY0y3wRSLh080cBBmoERgJvR7Lk8Rj4ep39-w@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>I meant to include the mailing list on my response.</div>
        <div><br>
        </div>
        <div>James.</div>
        <br>
        <div class="gmail_quote">
          <div class="gmail_attr" dir="ltr">---------- Forwarded message
            ---------<br>
            From: <strong class="gmail_sendername" dir="auto">James
              Mihm</strong> <span dir="auto">&lt;<a
                href="mailto:james.mihm@gmail.com"
                moz-do-not-send="true">james.mihm@gmail.com</a>&gt;</span><br>
            Date: Mon, Mar 9, 2020 at 7:11 PM<br>
            Subject: Re: Which repo is more stable, feature complete,
            most functionality? <a
              href="https://github.com/openbmc/openbmc"
              moz-do-not-send="true">https://github.com/openbmc/openbmc</a>
            or <a href="https://github.com/Intel-BMC/openbmc"
              moz-do-not-send="true">https://github.com/Intel-BMC/openbmc</a><br>
            To: Bruce Mitchell &lt;<a
              href="mailto:Bruce_Mitchell@phoenix.com"
              moz-do-not-send="true">Bruce_Mitchell@phoenix.com</a>&gt;<br>
          </div>
          <br>
          <br>
          <div dir="ltr">Bruce,
            <div><br>
            </div>
            <div>The Intel-BMC/openbmc repo is where we (i.e., Intel)
              pushes our internal fork externally while in the process
              of upstreaming. The intent for this repo is for it to be
              functional on an Intel development platform (e.g.,
              Wolfpass) at all times while upstreaming changes to the
              openbmc/openbmc repo. The long term goal is for Intel to
              be pushing all development upstream to the openbmc/openbmc
              repo, and using the Intel-BMC repository for sharing
              future capabilities that are not yet publically announced.
              Where our goal is to push our internal development fork to
              the Intel-BMC/openbmc repo every two weeks. </div>
            <div><br>
            </div>
            <div>Two exceptions for upstreaming are the webui and linux
              kernel patches. Upstreaming the linux kernel patches is
              challenging and some of the patches may never make it
              upstream. With the migration of the webui to vue.js
              there's not much point in upstreaming the Intel fork of
              phosphor-webui. </div>
            <div><br>
            </div>
            <div>My answer to your question is to use the
              openbmc/openbmc repository, but not for controlling your
              car brakes.</div>
            <div><br>
            </div>
            <div>James.  </div>
            <div><br>
            </div>
            <div><br>
            </div>
          </div>
          <br>
          <div class="gmail_quote">
            <div class="gmail_attr" dir="ltr">On Thu, Jan 16, 2020 at
              4:27 PM Bruce Mitchell &lt;<a
                href="mailto:Bruce_Mitchell@phoenix.com" target="_blank"
                moz-do-not-send="true">Bruce_Mitchell@phoenix.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">Which repo is more
              stable, feature complete, most functionality?  <a
                href="https://github.com/openbmc/openbmc"
                target="_blank" rel="noreferrer" moz-do-not-send="true">https://github.com/openbmc/openbmc</a>
              or <a href="https://github.com/Intel-BMC/openbmc"
                target="_blank" rel="noreferrer" moz-do-not-send="true">https://github.com/Intel-BMC/openbmc</a><br>
              <br>
              While the WebUI for <a
                href="https://github.com/Intel-BMC/openbmc"
                target="_blank" rel="noreferrer" moz-do-not-send="true">https://github.com/Intel-BMC/openbmc</a>
              may look better,<br>
              presently its functionality for BMC operation seems
              intermittent compared to the functionality of <a
                href="https://github.com/openbmc/openbmc"
                target="_blank" rel="noreferrer" moz-do-not-send="true">https://github.com/openbmc/openbmc</a>.<br>
              I am referring to basic things such as displaying the
              BMC's Firmware Version, the lack of displaying any NIC for
              Network Settings, the "hang" for Health Hardware Status. 
              <br>
              <br>
              This is not a request about ahead or behind; I am asking
              about stable, feature complete, most functionality.<br>
              <br>
              Using a metaphor here; if you had to select today one of
              the 2 for controlling your car's breaks which would it be?<br>
              <br>
              Thank you.<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------42489C4137989F85965DD8EA--
