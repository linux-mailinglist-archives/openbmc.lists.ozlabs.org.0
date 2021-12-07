Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C0C46C685
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 22:15:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7tPD1yGGz3dhg
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 08:15:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mY+UIVud;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mY+UIVud; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7tH96PHBz3cNB
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 08:10:13 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so481010oto.13
 for <openbmc@lists.ozlabs.org>; Tue, 07 Dec 2021 13:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=lv+TefjHo13HM1Kp3QVWpqgWygbe3knJv2OIMi4AQW0=;
 b=mY+UIVud89fU2KiENd0rl7cicunXQkR4TgrOX0gJBVLku0wxu2seDYMbBiliC/Rwjo
 dxOYGbkMdhrkX1szEB8EK5OtGXyBdbvJW0rkq1Ze9yvLjXX9MmQoHzTBNKrX9GrgvaTi
 iBTyyzCaQYYGAE3h570wsq/+whdWN2w8QoqglujNbIQkUR8+arklF3o4tk2lQEGFXgiI
 cIr5L2MKqz1YgaNMF2eJOdZ+S9yPoEy6MpfwT9qSTsbGIYHr/hfnFRLMPk3amcqyQEq8
 U5cojVRUmC3oGQOT0bWHRlxHa8GUH2rJKnzHpdB8IlZvSUl5/Nid1+bLFGeqC1J9z/3d
 EdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=lv+TefjHo13HM1Kp3QVWpqgWygbe3knJv2OIMi4AQW0=;
 b=qmlbSiW+j3lg7ar4FTq8SWJqBtYamsVTFA5ZgVvOBVTNPQ0CQUTSB94vxGgphaqbCJ
 h70Du1/83FyE+/0HBWFMcMDX9diZmDAamqAz2G9K2Zd1lA6TF3pdk4WLlwpjvNeDLzUZ
 KJIePYqwE+wq1kRJcFDy8xZ5/W1zyHlmJwKMR4oqOaUHIUf4cEA8Nd3jHnxjBYPvuVGJ
 Be8sNMa43xQZw+sGChqnqHWV4n+97vXQqisPM5FUjDGSC5YTeb51hQ8VZCkijS7lIxpl
 rPUat1gFa0K2r/WmpVWObCAxpsBou5B9pW6fBNQRf4kVC86q/WrjmMRL5/iginYJS025
 ixwA==
X-Gm-Message-State: AOAM531IirKVqEMDk0kLz4W6JXCRQQ4pw/IRcSKkf7b49Iwcl8CFuL/h
 /IR3+dIW+TDZrSQoNM4qE0meAOiyszk=
X-Google-Smtp-Source: ABdhPJyEW4XRLqAGhZgTbkuMTMqbKqcWyXnHW3m6/6oa3deyD02AUiOpXudAj/e8j6+yKwT4D6gRQA==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr37656641oto.189.1638911408878; 
 Tue, 07 Dec 2021 13:10:08 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:19e0:3310:618d:9fd1:a739:10aa])
 by smtp.gmail.com with ESMTPSA id z7sm160534oib.0.2021.12.07.13.10.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 Dec 2021 13:10:08 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH linux dev-5.15 1/2] ARM: dts: Aspeed: Rainier: Add GPIO
 hog for USB power control
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <1dfc35d0-c888-692e-dee3-342753d7228c@linux.ibm.com>
Date: Tue, 7 Dec 2021 15:10:07 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <EF9AEBD8-2106-4968-8CF6-8D9721D18876@gmail.com>
References: <20211206213218.104318-1-eajames@linux.ibm.com>
 <CACPK8XehjN1cvRPhOiVYh+3CARJnsr5yPZSwLHAoaLgVrF6gHA@mail.gmail.com>
 <1dfc35d0-c888-692e-dee3-342753d7228c@linux.ibm.com>
To: Eddie James <eajames@linux.ibm.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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



> On Dec 7, 2021, at 2:28 PM, Eddie James <eajames@linux.ibm.com> wrote:
>=20
>=20
> On 12/6/21 16:54, Joel Stanley wrote:
>> On Mon, 6 Dec 2021 at 21:32, Eddie James <eajames@linux.ibm.com> =
wrote:
>>> Set the USB power control to always on.
>>>=20
>>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>>> ---
>>>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>> index 866f32cdccea..b2af8ad09d33 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
>>> @@ -255,7 +255,7 @@ &gpio0 {
>>>         /*L0-L7*/       "","","","","","","","",
>>>         /*M0-M7*/       "","","","","","","","",
>>>         /*N0-N7*/       "","","","","","","","",
>>> -       /*O0-O7*/       "","","","usb-power","","","","",
>> Do we want to remove the pin from the gpio-names? Can we leave it
>> there as documentation, or does it conflict?
>=20
>=20
> I don't know; The pin isn't documented so I thought it better to =
remove it from the line names. Then below, I named it according to the =
board spec, which somewhat fits with the i2c mux hog. I'm open to =
whatever we think is best here.

The goal is to ensure GPIO=E2=80=99s which could have similar function =
between different boards have a common name so that userspace =
applications could just use that one name and work on multiple boards. =
Using a board name for the GPIO breaks that design point. But=E2=80=A6if =
the GPIO is only ever going to be used on a single system, or userspace =
already has a way to abstract the name, we=E2=80=99ve been getting less =
stringent on this rule. At first blush, the =E2=80=9Cusb-power=E2=80=9D =
name seemed nice and generic and it seems like a function that could be =
applicable across multiple systems. =
https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-namin=
g.md is the doc about this.=20

>=20
>=20
> Thanks!
>=20
> Eddie
>=20
>=20
>>=20
>>> +       /*O0-O7*/       "","","","","","","","",
>>>         /*P0-P7*/       "","","","","pcieslot-power","","","",
>>>         /*Q0-Q7*/       =
"cfam-reset","","regulator-standby-faulted","","","","","",
>>>         /*R0-R7*/       =
"bmc-tpm-reset","power-chassis-control","power-chassis-good","","","","","=
",
>>> @@ -275,6 +275,13 @@ i2c3_mux_oe_n {
>>>                 output-high;
>>>                 line-name =3D "I2C3_MUX_OE_N";
>>>         };
>>> +
>>> +       usb_power_en_n {
>>> +               gpio-hog;
>>> +               gpios =3D <ASPEED_GPIO(O, 3) GPIO_ACTIVE_LOW>;
>>> +               output-high;
>>> +               line-name =3D "USB_POWER_EN_N";
>> This contradicts what you called it above.
>>=20
>>> +       };
>>>  };
>>>=20
>>>  &emmc_controller {
>>> --
>>> 2.27.0

