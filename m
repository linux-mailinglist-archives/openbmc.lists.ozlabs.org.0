Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C56417C8691
	for <lists+openbmc@lfdr.de>; Fri, 13 Oct 2023 15:18:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cqngZCvh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6RsK52hHz3vch
	for <lists+openbmc@lfdr.de>; Sat, 14 Oct 2023 00:18:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cqngZCvh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=sunithaharish04@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6Rrj1vVmz3cR4
	for <openbmc@lists.ozlabs.org>; Sat, 14 Oct 2023 00:17:55 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c735473d1aso16032755ad.1
        for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2023 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697203072; x=1697807872; darn=lists.ozlabs.org;
        h=in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBSlwdNlLVVu5vX32bGErKui2NepzHYC9kOIRu/lIgc=;
        b=cqngZCvhm+gefBqllpbmiQ9JobFuOhkxmprjrhJXKWrvGTBVCNJuWmSbu4xDX0BT0o
         EtgjlQ3Mtz4SRJnF+5Db9FDahwCioSsU/XWH43ZizwISmZF+bJhEDBnl6cSIAEwXMlm5
         qpmgmFQ7oADpMu9uu08xeu3q0o5RDzo1+zuxyD8qAExuUBhOzoRpNBBPVK7h3wMjM/kf
         G1f5mMbV9xZrkxu4oTj/UDqfM//MrrgSHL5xXcESceLENr6y05ESZVF5ouxjaqCQ0WC9
         qI/MAZOfPEzKhzAUGThYLltpKmgD2X9q4p2Uftje/qPyh6Y1M6OVdvMm3UyC9HkCzDAX
         eaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697203072; x=1697807872;
        h=in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uBSlwdNlLVVu5vX32bGErKui2NepzHYC9kOIRu/lIgc=;
        b=orrTzARuFFHQaTaGMnQQ34sSJD5e3URfyQ880wkgdT6Yv6FQYhpOx70UVErAnNmKEC
         Qtn5mia0WLLJjosSgPo5mszmys5edc2QLqIFawyM2T8tdTMGpy/Nx6yv5kyApDdTZW9S
         gn1iYNjxuykliO4E2h6U/rRCJ+qjH+ri/wi8BPcvcP+Xlh+junsSPhfDx29EmyIKFi+5
         0AhhqgDJLflHVnrTipDzQf2FQBVVJQxnkAFrX+UAfJBa1Ds36yNwFqatKpbFiFe5TYbT
         DeEg0+VRAzaX+Z6smJXgpGgp9KTTj2f470QPYHiczI8yaNgwr/l9T7O6XLlN22i+EkG7
         jSog==
X-Gm-Message-State: AOJu0YzC5VdmXvm6y+OvaLRrxKPgByojbseURu+eu1Jq8YPE5gn6SVw/
	62aK0PIQNMN1jd/aalft1G4=
X-Google-Smtp-Source: AGHT+IEk6JBCzN2+2peQzWSRnPdIu6aEHZYUcblrMd0KGVFWnxKMEsTaBxGmU6rlx6g7sw2uPYRYLQ==
X-Received: by 2002:a17:902:c215:b0:1c9:cc41:76e4 with SMTP id 21-20020a170902c21500b001c9cc4176e4mr7939941pll.10.1697203071596;
        Fri, 13 Oct 2023 06:17:51 -0700 (PDT)
Received: from [192.168.0.104] ([106.51.173.253])
        by smtp.gmail.com with ESMTPSA id o11-20020a1709026b0b00b001c3267ae317sm3844259plk.165.2023.10.13.06.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 06:17:51 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------uiBebMQovGS402Pq1SnRyLbz"
Message-ID: <92860b17-b8b7-411d-a622-7952fd0660dd@gmail.com>
Date: Fri, 13 Oct 2023 18:47:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Add network RoutingPolicyRules at OpenBMC Networkd
Content-Language: en-US
To: Alexander Amelkin <a.amelkin@yadro.com>,
 raviteja bailapudi <raviteja28031990@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ratan Gupta <ratankgupta31@gmail.com>, "wak@google.com" <wak@google.com>,
 "johnathanx.mantey@intel.com" <johnathanx.mantey@intel.com>,
 fercerpav@gmail.com
References: <CAM4DKZnvnb=XMvxVhrfE13vvb+braB6J2TOhKMRxm+T09u88Fg@mail.gmail.com>
 <c0dc4e1ff3904a9c8f34c951611d3992@yadro.com>
From: Sunitha Harish <sunithaharish04@gmail.com>
In-Reply-To: <c0dc4e1ff3904a9c8f34c951611d3992@yadro.com>
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
--------------uiBebMQovGS402Pq1SnRyLbz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thank you Alexander for responding. As Paul mentioned rightly in another 
reply, this problem is seen with IPv4 only.

But when a system with two physical interfaces is shipped, i think it is 
expected that they should come up with link-local IP by default. So we 
should find a best way to solve this problem.

On 13-10-2023 16:48, Alexander Amelkin wrote:
>
> There is waaaay too many problems that we have with “multiple 
> interfaces using link-local addresses” per se.
>
Yes actually.
>
> They are outlined in 
> https://datatracker.ietf.org/doc/html/rfc3927#section-3 but no 
> solutions are actually provided there.
>
> When, in addition to that, you connect those multiple interfaces to 
> the same physical network segment, you add another
>
> bunch of problems on top that are discussed here:
>
> https://serverfault.com/questions/415304/multiple-physical-interfaces-with-ips-on-the-same-subnet
>
We tried these settings and this did not cover all the usecases as we 
expected. ( Static & DHCP and combination of both at the 2 interfaces)
>
>
> With your proposal, as I understand it, you may be solving one part of 
> the “scoped addresses” problem here, but the rest remains.
>
> I may be missing some use-cases, but I gather link-local addresses are 
> primarily needed for discovery of newly installed OpenBMC
>
> machines before they are properly integrated into a DHCP-based or 
> statically configure network. Taking that into account, in my
>
> humble opinion, the best way would be to have link-local addressing 
> enabled for just eth0.
>
Yes, currently the problem workaround is to enable the link-local only 
on eth0.

> I also believe that in production environments the BMC shall not be 
> connected to the same network segment using multiple interfaces.
>
> If that is needed for failover, then we should think about adding the 
> bridging and bonding support instead.
>
Do you have more details on this please?
>
> WBR, Alexander Amelkin
>
> P.S. I also believe that it is VERY wrong that we still allow setting 
> per-interface gateways as BMC is not a router device and doesn’t (and 
> shouldn’t) allow for configuring policy routing or any routing whatsoever.
>
I believe this was done purposefully some years ago. @Ravi please share 
the details if you have the history.

Thanks &regards,
Sunitha
>
> *From:*openbmc <openbmc-bounces+a.amelkin=yadro.com@lists.ozlabs.org> 
> *On Behalf Of *raviteja bailapudi
> *Sent:* Wednesday, October 11, 2023 11:27 AM
> *To:* OpenBMC Maillist <openbmc@lists.ozlabs.org>; Ratan Gupta 
> <ratankgupta31@gmail.com>; wak@google.com; Sunitha Harish 
> <sunithaharish04@gmail.com>; johnathanx.mantey@intel.com
> *Subject:* Add network RoutingPolicyRules at OpenBMC Networkd
>
> «Внимание! Данное письмо от внешнего адресата!»
>
> Hi Team
>
> We have noticed network routing issues when the same subnet IP 
> addresses configured on both eth0 and eth1 ethernet interfaces, this 
> issue applies to all types of addresses like static, DHCP and 
> LinkLocal address configuration.
>
> Currently IPv4 LinkLocal addressing is enabled on both interfaces, so 
> both interfaces come up with the same subnet Link local IP addresses 
> (169.254.x.y), but only one link local address will be reachable due 
> to these same subnet routes on both interfaces.
>
> Here is the systemd issue 
> https://github.com/systemd/systemd/issues/28814 
> <https://github.com/systemd/systemd/issues/28814>
> I have discussed in the systemd community and explored systemd's 
> RoutingPolicyRules configuration as suggested by the systemd community 
> and it works.
>
> To solve this problem we are proposing to make changes in 
> phosphor-networkd to configure/populate systemd-networkd 
> RoutingPolicyRule for each IP address configured on each interface, 
> there is no user intervention or user interface changes needed. 
> phosphor-networkd internally takes care of updating the 
> systemd-networkd configuration as required
>
> Here is the example of additional systemd configuration required for 
> each IP address configured on the interface.
> Example:
> [Route]
> PreferredSource=169.254.202.113
> Destination=169.254.202.113/16 <http://169.254.202.113/16>
> Table=11
> [Route]
> Gateway=169.254.0.0
> Table=11
> [RoutingPolicyRule]
> Table=11
> To=169.254.202.113/16 <http://169.254.202.113/16>
> [RoutingPolicyRule]
> Table=11
> From=169.254.202.113/16 <http://169.254.202.113/16>
>
> Please share your views on the same.
>
> Regards,
>
> Raviteja
>
--------------uiBebMQovGS402Pq1SnRyLbz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Thank you Alexander for responding. As Paul mentioned rightly in
      another reply, this problem is seen with IPv4 only.<br>
    </p>
    <p>But when a system with two physical interfaces is shipped, i
      think it is expected that they should come up with link-local IP
      by default. So we should find a best way to solve this problem.<br>
    </p>
    <div class="moz-cite-prefix">On 13-10-2023 16:48, Alexander Amelkin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c0dc4e1ff3904a9c8f34c951611d3992@yadro.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator"
        content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}@font-face
	{font-family:Cambria;
	panose-1:2 4 5 3 5 4 6 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">There is waaaay too many problems that we have
            with “multiple interfaces using link-local addresses” per
            se.</span></p>
      </div>
    </blockquote>
    Yes actually.<br>
    <blockquote type="cite"
      cite="mid:c0dc4e1ff3904a9c8f34c951611d3992@yadro.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">They are outlined in
            <a
href="https://datatracker.ietf.org/doc/html/rfc3927#section-3"
              moz-do-not-send="true" class="moz-txt-link-freetext">https://datatracker.ietf.org/doc/html/rfc3927#section-3</a>
            but no solutions are actually provided there.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">When, in addition to that, you connect those
            multiple interfaces to the same physical network segment,
            you add another<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">bunch of problems on top that are discussed
            here:<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US"><a
href="https://serverfault.com/questions/415304/multiple-physical-interfaces-with-ips-on-the-same-subnet"
              moz-do-not-send="true" class="moz-txt-link-freetext">https://serverfault.com/questions/415304/multiple-physical-interfaces-with-ips-on-the-same-subnet</a></span></p>
      </div>
    </blockquote>
    We tried these settings and this did not cover all the usecases as
    we expected. ( Static &amp; DHCP and combination of both at the 2
    interfaces)<br>
    <blockquote type="cite"
      cite="mid:c0dc4e1ff3904a9c8f34c951611d3992@yadro.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US"><br>
            With your proposal, as I understand it, you may be solving
            one part of the “scoped addresses” problem here, but the
            rest remains.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">I may be missing some use-cases, but I gather
            link-local addresses are primarily needed for discovery of
            newly installed OpenBMC<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">machines before they are properly integrated
            into a DHCP-based or statically configure network. Taking
            that into account, in my<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">humble opinion, the best way would be to have
            link-local addressing enabled for just eth0.<br>
            <br>
          </span></p>
      </div>
    </blockquote>
    <p>Yes, currently the problem workaround is to enable the link-local
      only on eth0.</p>
    <blockquote type="cite"
      cite="mid:c0dc4e1ff3904a9c8f34c951611d3992@yadro.com">
      <div class="WordSection1">
        <p class="MsoNormal"></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">I also believe that in production environments
            the BMC shall not be connected to the same network segment
            using multiple interfaces.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">If that is needed for failover, then we should
            think about adding the bridging and bonding support instead.<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US"><o:p> </o:p></span></p>
      </div>
    </blockquote>
    Do you have more details on this please? <br>
    <blockquote type="cite"
      cite="mid:c0dc4e1ff3904a9c8f34c951611d3992@yadro.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">WBR, Alexander Amelkin<o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US"><o:p> </o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US">P.S. I also believe that it is VERY wrong that
            we still allow setting per-interface gateways as BMC is not
            a router device and doesn’t (and shouldn’t) allow for
            configuring policy routing or any routing whatsoever.</span></p>
      </div>
    </blockquote>
    <p>I believe this was done purposefully some years ago. @Ravi please
      share the details if you have the history.</p>
    Thanks &amp;regards,<br>
    Sunitha<br>
    <blockquote type="cite"
      cite="mid:c0dc4e1ff3904a9c8f34c951611d3992@yadro.com">
      <div class="WordSection1">
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US"><o:p></o:p></span></p>
        <p class="MsoNormal"><span style="mso-fareast-language:EN-US"
            lang="EN-US"><o:p> </o:p></span></p>
        <div>
          <div
style="border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
            <p class="MsoNormal"><b><span lang="EN-US">From:</span></b><span
                lang="EN-US"> openbmc
                <a class="moz-txt-link-rfc2396E" href="mailto:openbmc-bounces+a.amelkin=yadro.com@lists.ozlabs.org">&lt;openbmc-bounces+a.amelkin=yadro.com@lists.ozlabs.org&gt;</a>
                <b>On Behalf Of </b>raviteja bailapudi<br>
                <b>Sent:</b> Wednesday, October 11, 2023 11:27 AM<br>
                <b>To:</b> OpenBMC Maillist
                <a class="moz-txt-link-rfc2396E" href="mailto:openbmc@lists.ozlabs.org">&lt;openbmc@lists.ozlabs.org&gt;</a>; Ratan Gupta
                <a class="moz-txt-link-rfc2396E" href="mailto:ratankgupta31@gmail.com">&lt;ratankgupta31@gmail.com&gt;</a>; <a class="moz-txt-link-abbreviated" href="mailto:wak@google.com">wak@google.com</a>; Sunitha
                Harish <a class="moz-txt-link-rfc2396E" href="mailto:sunithaharish04@gmail.com">&lt;sunithaharish04@gmail.com&gt;</a>;
                <a class="moz-txt-link-abbreviated" href="mailto:johnathanx.mantey@intel.com">johnathanx.mantey@intel.com</a><br>
                <b>Subject:</b> Add network RoutingPolicyRules at
                OpenBMC Networkd<o:p></o:p></span></p>
          </div>
        </div>
        <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
        <div style="border:dotted #003333 1.0pt;padding:0cm 0cm 0cm 0cm">
          <p
style="text-align:center;mso-line-height-alt:0pt;background:#F7A29C"
            align="center">
            <span
style="font-size:10.0pt;font-family:&quot;Cambria&quot;,serif;color:black">«Внимание!
              Данное письмо от внешнего адресата!»
            </span><span
style="font-size:10.0pt;font-family:&quot;Cambria&quot;,serif"><o:p></o:p></span></p>
        </div>
        <div>
          <div>
            <p class="MsoNormal"><span lang="EN-US">Hi Team<br>
                <br>
                We have noticed network routing issues when the same
                subnet IP addresses configured on both eth0 and eth1
                ethernet interfaces, this issue applies to all types of
                addresses like static, DHCP and LinkLocal address
                configuration.<br>
                <br>
                Currently IPv4 LinkLocal addressing is enabled on both
                interfaces, so both interfaces come up with the same
                subnet Link local IP addresses (169.254.x.y), but only
                one link local address will be reachable due to these
                same subnet routes on both interfaces.<br>
                <br>
                Here is the systemd issue </span><a
                href="https://github.com/systemd/systemd/issues/28814"
                moz-do-not-send="true"><span lang="EN-US">https://github.com/systemd/systemd/issues/28814</span></a><span
                lang="EN-US">
                <br>
                I have discussed in the systemd community and explored
                systemd's RoutingPolicyRules configuration as suggested
                by the systemd community and it works.<br>
                <br>
                To solve this problem we are proposing to make changes
                in phosphor-networkd to configure/populate
                systemd-networkd RoutingPolicyRule for each IP address
                configured on each interface, there is no user
                intervention or user interface changes needed.
                phosphor-networkd internally takes care of updating the
                systemd-networkd configuration as required<br>
                <br>
                Here is the example of additional systemd configuration
                required for each IP address configured on the
                interface.<br>
                Example:<br>
                [Route]<br>
                PreferredSource=169.254.202.113<br>
                Destination=</span><a href="http://169.254.202.113/16"
                moz-do-not-send="true"><span lang="EN-US">169.254.202.113/16</span></a><span
                lang="EN-US"><br>
                Table=11<br>
                [Route]<br>
                Gateway=169.254.0.0<br>
                Table=11<br>
                [RoutingPolicyRule]<br>
                Table=11<br>
                To=</span><a href="http://169.254.202.113/16"
                moz-do-not-send="true"><span lang="EN-US">169.254.202.113/16</span></a><span
                lang="EN-US"><br>
                [RoutingPolicyRule]<br>
                Table=11<br>
                From=</span><a href="http://169.254.202.113/16"
                moz-do-not-send="true"><span lang="EN-US">169.254.202.113/16</span></a><span
                lang="EN-US"><br>
                <br>
                Please share your views on the same. <o:p></o:p></span></p>
            <div>
              <p class="MsoNormal"><span lang="EN-US"><o:p> </o:p></span></p>
            </div>
            <div>
              <p class="MsoNormal">Regards,<o:p></o:p></p>
            </div>
            <div>
              <p class="MsoNormal">Raviteja<o:p></o:p></p>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------uiBebMQovGS402Pq1SnRyLbz--
