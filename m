Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F5918652
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 09:43:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45051D5bZJzDqQD
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 17:43:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Id8M+12A"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45050H221XzDqMK
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 17:42:22 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id a5so704529pls.12
 for <openbmc@lists.ozlabs.org>; Thu, 09 May 2019 00:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:date:references:to:in-reply-to:message-id;
 bh=2xjg73eGPvoXxr0r+j/Lz/3fqmo9zQB1fy5Stsnl67M=;
 b=Id8M+12A9s2HQVnRwpJiOQTz1oCz9KCmlTq9T3BJMWd6IXZA8PZVk8kAXKSmGGdyJl
 DGm24xSPlUEJmoQ5JFRFby1sLO8VTwOmVRVpYvlp4bE/zLafJDVQqpvPM2s5y8NcmsCk
 XFNzCopvqLKbzDsFTbYZq4MWsAeSqRqmNonNQg15xarjldSFCDMQ33t7+5IBPPlZzuJO
 v2aZshTq/InAotseOOLirylEfDlsZ9O/a0WTbVs1ZjAJ4ihia9oAQVedz4Z5DfbZaraS
 VHC83JqXA8LbuAv8Or9cRt2QZNudG8VXfg/pd+YLTWvWuwSABramgGDnarHUMqsoYrzq
 rZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:date:references:to
 :in-reply-to:message-id;
 bh=2xjg73eGPvoXxr0r+j/Lz/3fqmo9zQB1fy5Stsnl67M=;
 b=P8nCf9A25FFnUKoTLamScx9T3WpFnROOuRZdxcOWizVaOHaCeXGZgihs8uPTQ2E9Xh
 DC+ixLra4QI2QVtJrFU9gOapkQFVz0JO6cWSXLfxUXP2S53XP8etdUnvgcVPQscHLue2
 4I+cSn9uTKdQ/qolnlGarQSh70PmBsJz0VpC16RipRWgBKkubA5tvwDzhrV0xGiinPmI
 hmAsdBeSnsK+7uPVhAbeRdD6CsfraiCkub3z5xKj/SeKpN6PHfdwKHWcm+VpKZjjDlou
 fkXB5C2uWML0AfWKBWVNSSwWFxtNqAZRlhIn7WYknwKk8Pw+HmuLOmKJZKMxZ0CFcxtw
 PpMg==
X-Gm-Message-State: APjAAAXm5B4+MZQfxFS7hQVKnxgtSNrpagIPuDmyAYuwWMU9FCazFKhp
 9W6oOouADgDH3Mb3EDFIVtw=
X-Google-Smtp-Source: APXvYqz2te/tllUicND7JcO/D2TY0/8PjOi1jBYGcpHbse7ANpNLXXm2aq//wxRBsJnt/13a1oiCVQ==
X-Received: by 2002:a17:902:7883:: with SMTP id
 q3mr3173342pll.60.1557387739095; 
 Thu, 09 May 2019 00:42:19 -0700 (PDT)
Received: from [192.168.1.2] (220-128-238-121.HINET-IP.hinet.net.
 [220.128.238.121])
 by smtp.gmail.com with ESMTPSA id h189sm1911797pfc.125.2019.05.09.00.42.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 May 2019 00:42:18 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_29BDDA07-2656-4A39-8F7F-46F4A8DD1ACE"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: How to set GPIOs to pre-defined value
Date: Thu, 9 May 2019 15:42:14 +0800
References: <365A980B-9730-411A-A91B-EB0A97026D95@gmail.com>
 <acf57f4c-08bd-40db-a77a-bb7f4f9f5938@Spark>
 <A2B0CA36-50FC-4A4D-A1EE-C87B3A55223C@gmail.com>
 <18ccd5d6-0bce-4990-9d0a-62f97fae5b3b@www.fastmail.com>
 <88066601-2367-45ce-98f5-8193a02534fb@Spark>
To: Samuel Jiang <chyishian.jiang@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org
In-Reply-To: <88066601-2367-45ce-98f5-8193a02534fb@Spark>
Message-Id: <D8F913E3-6078-4C81-A26C-FB2A45052C62@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
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


--Apple-Mail=_29BDDA07-2656-4A39-8F7F-46F4A8DD1ACE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 8, 2019, at 9:53 AM, Andrew Jeffery <andrew@aj.id.au =
<mailto:andrew@aj.id.au>> wrote:
>=20
>=20
>=20
> On Tue, 7 May 2019, at 18:23, Brad Chou wrote:
>> Hi Samuel,
>> Thanks for your reply, I am using AST2500.
>> I tried add gpio-hog settings into my device tree, and yes, the GPIO=20=

>> works as it defined.
>> But all GPIOs defined by gpio-hog can not be modified in user space =
by=20
>> gpioset / gpioget utility.
>> I need to set all GPIOs to pre-defined state and can change it at run=20=

>> time.
>> Set GPIOs in Device tree is trying to lock it by a fixed direction =
and=20
>> value.
>>=20
>=20
> This problem is probably best taken up with upstream. Currently GPIO
> nodes in the devicetree are ignored if they do not have the `gpio-hog`
> property:
>=20
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dr=
ivers/gpio/gpiolib-of.c?h=3Dv5.1#n454 =
<https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/gpio/gpiolib-of.c?h=3Dv5.1#n454>
>=20
> Changing that might be a hard argument - it may impact existing
> devicetrees that expect the current behaviour.
>=20
> However, I'm interested in what you see wrong with doing this from
> userspace? What requirements do you have that would need this to
> be done in the kernel?
>=20
> Cheers,
>=20
> Andrew

I don=E2=80=99t really need it to be set in the kernel.
Just curious about how openBMC initial all GPIOs, especially for AST2500 =
that has over 200+ GPIOs.
And gpio-hog meaning - to take or use a lot of something in a way that =
prevents other people from having this gpio.
So no one can operate it after set gpio-hog.
Any userspace operations just got an error similar to this, assume you =
hog gpio 35 in the kernel :
gpioget gpiochip0 35
gpioget: error reading GPIO values: Device or resource busy


> On May 8, 2019, at 6:32 PM, Samuel Jiang <chyishian.jiang@gmail.com> =
wrote:
>=20
> Hi Brad,
> On May 7, 2019, 4:52 PM +0800, Brad Chou <chou.brad@gmail.com>, wrote:
>> Hi Samuel,
>> Thanks for your reply, I am using AST2500.
>> I tried add gpio-hog settings into my device tree, and yes, the GPIO =
works as it defined.
>> But all GPIOs defined by gpio-hog can not be modified in user space =
by gpioset / gpioget utility.
>> I need to set all GPIOs to pre-defined state and can change it at run =
time.
>> Set GPIOs in Device tree is trying to lock it by a fixed direction =
and value.
>>=20
>> Thanks.
>=20
> You could trace the gpioplus library how does it implement control =
pins, it seems direct modify by gpio chips.

Since openBMC has no individual recipes to do GPIO initial.
Gpioplus is the preferred way to control GPIOs.
Thanks.

>=20
>> Now, I am using a shell script with gpioset utility to do the job.
>> But I know using shell to do it is a bad idea.
>> Does anyone have better ideas ?=20
>=20
>=20
> In my situation, I still use shell script export pin which didn't =
pre-define output high or low and control GPIOs program by c++ at =
runtime.
> But I think the previous shell script also could rewrite to c++.
>=20
>=20
> Thanks,
> Samuel Jiang
>=20
>=20
>=20


--Apple-Mail=_29BDDA07-2656-4A39-8F7F-46F4A8DD1ACE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><blockquote type=3D"cite" class=3D""><div class=3D"">On =
May 8, 2019, at 9:53 AM, Andrew Jeffery &lt;<a =
href=3D"mailto:andrew@aj.id.au" class=3D"">andrew@aj.id.au</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><br =
class=3D""><br class=3D"">On Tue, 7 May 2019, at 18:23, Brad Chou =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">Hi Samuel,<br =
class=3D"">Thanks for your reply, I am using AST2500.<br class=3D"">I =
tried add gpio-hog settings into my device tree, and yes, the =
GPIO&nbsp;<br class=3D"">works as it defined.<br class=3D"">But all =
GPIOs defined by gpio-hog can not be modified in user space by&nbsp;<br =
class=3D"">gpioset / gpioget utility.<br class=3D"">I need to set all =
GPIOs to pre-defined state and can change it at run&nbsp;<br =
class=3D"">time.<br class=3D"">Set GPIOs in Device tree is trying to =
lock it by a fixed direction and&nbsp;<br class=3D"">value.<br =
class=3D""><br class=3D""></blockquote><br class=3D"">This problem is =
probably best taken up with upstream. Currently GPIO<br class=3D"">nodes =
in the devicetree are ignored if they do not have the `gpio-hog`<br =
class=3D"">property:<br class=3D""><br class=3D""><a =
href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/drivers/gpio/gpiolib-of.c?h=3Dv5.1#n454" =
class=3D"">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/tree/drivers/gpio/gpiolib-of.c?h=3Dv5.1#n454</a><br class=3D""><br =
class=3D"">Changing that might be a hard argument - it may impact =
existing<br class=3D"">devicetrees that expect the current behaviour.<br =
class=3D""><br class=3D"">However, I'm interested in what you see wrong =
with doing this from<br class=3D"">userspace? What requirements do you =
have that would need this to<br class=3D"">be done in the kernel?<br =
class=3D""><br class=3D"">Cheers,<br class=3D""><br =
class=3D"">Andrew</div></blockquote><br class=3D"">I don=E2=80=99t =
really need it to be set in the kernel.<div class=3D"">Just&nbsp;curious =
about how openBMC initial all GPIOs, especially for AST2500 that has =
over 200+ GPIOs.<br class=3D""><div class=3D""><div>And gpio-hog meaning =
- to take or use a lot of something in a way that prevents other people =
from having this gpio.</div><div>So no one can operate it after set =
gpio-hog.</div><div>Any userspace operations just got an error similar =
to this, assume you hog gpio 35 in the kernel :</div><div>gpioget =
gpiochip0 35<br class=3D"">gpioget: error reading GPIO values: Device or =
resource busy</div></div></div><div><br class=3D""></div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On May =
8, 2019, at 6:32 PM, Samuel Jiang &lt;<a =
href=3D"mailto:chyishian.jiang@gmail.com" =
class=3D"">chyishian.jiang@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D"">

<title class=3D""></title>

<div class=3D"">
<div name=3D"messageBodySection" style=3D"font-size: 14px; font-family: =
-apple-system, BlinkMacSystemFont, sans-serif;" class=3D"">
<div style=3D"caret-color: rgb(39, 39, 40);" class=3D"">Hi Brad,</div>
</div>
<div name=3D"messageReplySection" style=3D"font-size: 14px; font-family: =
-apple-system, BlinkMacSystemFont, sans-serif;" class=3D"">On May 7, =
2019, 4:52 PM +0800, Brad Chou &lt;<a href=3D"mailto:chou.brad@gmail.com" =
class=3D"">chou.brad@gmail.com</a>&gt;, wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"spark_quote" style=3D"margin: 5px; =
padding-left: 10px; border-left-width: thin; border-left-style: solid; =
border-left-color: rgb(26, 188, 156);">Hi Samuel,
<div class=3D"">Thanks for your reply, I am using AST2500.</div>
<div class=3D"">I tried add gpio-hog settings into my device tree, and =
yes, the GPIO works as it defined.</div>
<div class=3D"">But all GPIOs defined by gpio-hog can not be modified in =
user space by gpioset / gpioget utility.</div>
<div class=3D"">I need to set all GPIOs to pre-defined state and can =
change it at run time.</div>
<div class=3D"">Set GPIOs in Device tree is trying to lock it by a fixed =
direction and value.</div>
<div class=3D""><br class=3D""></div>
<div class=3D"">Thanks.</div>
<div class=3D"">
<div class=3D""></div>
</div>
</blockquote>
<br class=3D"">
<div class=3D"">You could trace the gpioplus library how does it =
implement control pins, it seems direct modify by gpio chips.<br =
class=3D""></div></div></div></div></blockquote><div><br =
class=3D""></div><div>Since openBMC has no individual recipes to do GPIO =
initial.</div><div>Gpioplus is the preferred way to control =
GPIOs.</div><div>Thanks.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D""><div =
name=3D"messageReplySection" style=3D"font-size: 14px; font-family: =
-apple-system, BlinkMacSystemFont, sans-serif;" class=3D"">
<div dir=3D"auto" class=3D""><br class=3D""></div>
<div dir=3D"auto" class=3D"">
<blockquote type=3D"cite" class=3D"spark_quote" style=3D"caret-color: =
rgb(39, 39, 40); margin: 5px; padding-left: 10px; border-left-width: =
thin; border-left-style: solid; border-left-color: rgb(26, 188, =
156);">Now, I am using a shell script with gpioset utility to do the =
job.<br class=3D"">
But I know using shell to do it is a bad idea.<br class=3D"">
Does anyone have better ideas ?&nbsp;</blockquote>
<br class=3D"">
<div class=3D""><br class=3D""></div>
</div>
<div dir=3D"auto" class=3D"">In my situation, I still use shell script =
export pin which didn't pre-define output high or low and control GPIOs =
program by c++ at runtime.<br class=3D"">
But I think the previous shell script also could rewrite to c++.<br =
class=3D""></div>
<div dir=3D"auto" class=3D""><br class=3D""></div>
<div dir=3D"auto" class=3D""><br class=3D""></div>
<div dir=3D"auto" class=3D"">Thanks,</div>
<div dir=3D"auto" class=3D"">Samuel Jiang</div>
<div dir=3D"auto" class=3D""><br class=3D""></div>
<div dir=3D"auto" class=3D""><br class=3D""></div>
<br class=3D""></div>
</div>

</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_29BDDA07-2656-4A39-8F7F-46F4A8DD1ACE--
