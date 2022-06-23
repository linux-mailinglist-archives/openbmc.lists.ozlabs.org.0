Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47955762F
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 11:03:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTDmw5WpBz3c5C
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 19:03:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S6rFfmfe;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com; envelope-from=raviteja28031990@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S6rFfmfe;
	dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTDmV2CpDz304J
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 19:02:49 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id y18so3306422iof.2
        for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jFsibrkXAPPXDYdyEbxhwiRJM4Ou/NCvsr+PpUm5nVI=;
        b=S6rFfmfeHgNivLb0f+/t+I1OJQEy4KMc4zIcIjcs50TgbSspbPZsQRt5Ht1RbBE2qf
         ln2tQbyS19ID41bP/UwR3fogaK29fxSBtNPT4VoGExCt029ef9ciyly5YtfVJ59MenSX
         1Nl5f1y4NLdBMg9gxpccIcO3RnxqzoJCbYuze8wc8ySt/Ob3DsCQJridABdyMIwrF0Kr
         QZJ0ViSNRnHpucTZ9tnfh/GJcPN5lblB3vZbJW1/hBDmbnbPzxN4hihVgA6t1k0Cx63W
         HlR4mhh1v2s3D+WDtuUFM+wyWMI1DDadMS044DcGmOlHJgCKaJ4nkyefhDfSipS/BOL7
         lOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jFsibrkXAPPXDYdyEbxhwiRJM4Ou/NCvsr+PpUm5nVI=;
        b=hV6L+cNo1Xn+BRBYQmsgmlsa17kEJdfaU/L/Kndai0ZlG8xyqEjSLyJ/MVGkC3qa91
         V19KXYlx6H2niEVnqPfKSio2aLydwAIZCkfo/rTbvNvJ2p7YgntkSGbmB40IWolnwvUv
         xp2W1ueU7xVszhvhs5xASTaJqV24GPlSjCKq6YEJ+myEbo8uRqHFBucF9DhsEVwjUwgK
         zFteeLKXqZH6H+JCErxeLU/qvq/aR0Xmor94PltUWNu2iZnvQ5TSu7TzKtSrm/ekVhDt
         VEFZEByNCewk/8ASrX1Zpuj+YFvWSkUx3z30P9RJ78/hW/00lonOps/VK3C8TdmX5CYC
         LvJQ==
X-Gm-Message-State: AJIora8FLVz41w9h09Vw0WQuouNZxAWnmlxfgGdB1El3UTfx2TysB1hX
	jrhzmYyNDmlFFxpffk/52tqCeN3ThAaG11PfFLg=
X-Google-Smtp-Source: AGRyM1uBAZ07NxUmJyQZzgpBkX5tjAV7S9SiR3bMRHsl8oUtPmJXuzAOcjWtt++TlQyM6AtLN0fjI0i+V2Oaw/O+vHY=
X-Received: by 2002:a05:6638:1342:b0:331:e382:b0af with SMTP id
 u2-20020a056638134200b00331e382b0afmr4718107jad.32.1655974966511; Thu, 23 Jun
 2022 02:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4DKZkkKx_MPVv_R7WqOhnKA+hRYWU4GK=DqbqqSVj_CtMtMg@mail.gmail.com>
 <CAMhqiMoQmZgSdkAjSDYTooPnW7Ta=bQYFZVkfoOr=ZmUzvceiA@mail.gmail.com>
In-Reply-To: <CAMhqiMoQmZgSdkAjSDYTooPnW7Ta=bQYFZVkfoOr=ZmUzvceiA@mail.gmail.com>
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Thu, 23 Jun 2022 14:32:35 +0530
Message-ID: <CAM4DKZnRcbXDofTDOLVMpG9DnMXH06w8r3+zH9cVOxuffUUM3A@mail.gmail.com>
Subject: Re: OpenBMC Network Route Management: Metric and Static Route config support
To: Ratan Gupta <ratankgupta31@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a2cc4d05e219b723"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a2cc4d05e219b723
Content-Type: text/plain; charset="UTF-8"

Hi Ratan
Yes, Clients will  have control on the routing table by configuring the
metric value while configuring IPv4 Static Address.

Regards,
Raviteja

On Thu, Jun 23, 2022 at 2:09 PM Ratan Gupta <ratankgupta31@gmail.com> wrote:

> Hi Raviteja,
>
> Are you mentioning that both the default gateways are pingable and the
> kernel picks up the one which is not desirable by you and you want to
> control which one to be picked up by configuring the metric value?
>
> Ratan
>
> On Wed, Jun 22, 2022 at 4:20 PM raviteja bailapudi <
> raviteja28031990@gmail.com> wrote:
>
>> Hi Team
>>
>> We have hit network routing issues while using Static IPv4 addresses on
>> both eth0 and eth1,  as both default gateways at the interfaces were of the
>> same metric value. To solve this problem we are planning to provide an
>> interface for admins to set the metric value for the gateway while setting
>> up the Static IPv4 network on BMC.
>>
>>
>> To enable users to connect from outside-subnet clients, we also need to
>> support static routes on BMC.
>>
>>
>> I have started a thread in redfish forum as well
>>
>>
>> https://redfishforum.com/thread/683/network-routing-table-management-support
>>
>>
>> Please share your views on the same.
>>
>>
>>
>> Regards,
>>
>> Raviteja
>>
>

--000000000000a2cc4d05e219b723
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Ratan<div>Yes, Clients will =C2=A0have=
 control on the routing table by configuring the metric value while configu=
ring IPv4 Static Address.<br></div><div><br></div></div>Regards,<div>Ravite=
ja</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Jun 23, 2022 at 2:09 PM Ratan Gupta &lt;<a href=3D"mailto:ra=
tankgupta31@gmail.com">ratankgupta31@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr">Hi Raviteja,<div><br></div><div>Are you menti=
oning that both the default gateways are pingable and the kernel picks up t=
he one which is not desirable by you and you want to control which one to b=
e picked up by configuring the metric value?</div><div><br></div><div>Ratan=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, Jun 22, 2022 at 4:20 PM raviteja bailapudi &lt;<a href=3D"mai=
lto:raviteja28031990@gmail.com" target=3D"_blank">raviteja28031990@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi Team<div><br=
></div><div><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-=
height:normal;font-family:&quot;Helvetica Neue&quot;">We have hit network r=
outing issues while using Static IPv4 addresses on both eth0 and eth1,=C2=
=A0 as both default gateways at the interfaces were of the same metric valu=
e. To solve this problem we are planning to provide an interface for admins=
 to set the metric value for the gateway while setting up the Static IPv4 n=
etwork on BMC.</p><p style=3D"margin:0px;font-stretch:normal;font-size:13px=
;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p>
<p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:norma=
l;font-family:&quot;Helvetica Neue&quot;">To enable users=C2=A0to connect f=
rom outside-subnet clients, we also need to support static routes on BMC.</=
p><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:nor=
mal;font-family:&quot;Helvetica Neue&quot;"><br></p><p style=3D"margin:0px;=
font-stretch:normal;font-size:13px;line-height:normal;font-family:&quot;Hel=
vetica Neue&quot;">I have started a thread in redfish forum as well</p><p s=
tyle=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:normal;fo=
nt-family:&quot;Helvetica Neue&quot;;color:rgb(220,161,13)"><a href=3D"http=
s://redfishforum.com/thread/683/network-routing-table-management-support" t=
arget=3D"_blank">https://redfishforum.com/thread/683/network-routing-table-=
management-support</a></p></div><div><p style=3D"margin:0px;font-stretch:no=
rmal;font-size:13px;line-height:normal;font-family:&quot;Helvetica Neue&quo=
t;"><br></p><p style=3D"margin:0px;font-stretch:normal;font-size:13px;line-=
height:normal;font-family:&quot;Helvetica Neue&quot;">Please share your vie=
ws on the same.</p><p style=3D"margin:0px;font-stretch:normal;font-size:13p=
x;line-height:normal;font-family:&quot;Helvetica Neue&quot;"><br></p><p sty=
le=3D"margin:0px;font-stretch:normal;font-size:13px;line-height:normal;font=
-family:&quot;Helvetica Neue&quot;"><br></p><p style=3D"margin:0px;font-str=
etch:normal;font-size:13px;line-height:normal;font-family:&quot;Helvetica N=
eue&quot;">Regards,</p><p style=3D"margin:0px;font-stretch:normal;font-size=
:13px;line-height:normal;font-family:&quot;Helvetica Neue&quot;">Raviteja<b=
r></p></div></div>
</blockquote></div>
</blockquote></div></div></div>

--000000000000a2cc4d05e219b723--
