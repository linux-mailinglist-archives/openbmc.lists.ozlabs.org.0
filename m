Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD107E6A9E
	for <lists+openbmc@lfdr.de>; Thu,  9 Nov 2023 13:32:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XQSMndge;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SR1Yf1P9nz3cS5
	for <lists+openbmc@lfdr.de>; Thu,  9 Nov 2023 23:32:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XQSMndge;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SR1Y15Ctfz30YZ
	for <openbmc@lists.ozlabs.org>; Thu,  9 Nov 2023 23:31:47 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-692c02adeefso781453b3a.3
        for <openbmc@lists.ozlabs.org>; Thu, 09 Nov 2023 04:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699533102; x=1700137902; darn=lists.ozlabs.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVI79wNia8uEnYAyEAtsqaroacqbg0p7sTHgGhpCjHg=;
        b=XQSMndgeTXw0j+jNWlfnuGsuiGYd6FHv1+DvqnCdWuvRMOUbwa600IdhQPtQmJMmt2
         iKUOgfXTPjp9LoSEZ6fX3FImmshifw6uaeqIlXcGb7g/QSPBlrPJ1IRUGu7jPlLL2JCm
         PBIQzB5I6OVrBXYReEywfs5TyujPlOY1W6Pf7hi2jnx3q0LGhwYO87+x/2Wqe4jlVXhH
         jRWATyjmh27o9vxySsgGhUjj1MVCQMs8T1euHxWb1vNwxvzSB+Vd038bp6k3yp+0rxtt
         apb+AFcoGngI2cDhS5SMIxnfZXQUMxDeFgkB4EHLO2ZDA0G/hZiKtTCwRLFdz73izIFU
         Gr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699533102; x=1700137902;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FVI79wNia8uEnYAyEAtsqaroacqbg0p7sTHgGhpCjHg=;
        b=fXLMMunV9NKJTa+XndAQu0okhJQfWqjd9z6hruHP7l0CNUCq1mR9x3xFC3NDGxo1fq
         QFbVkJ0BReP/ZTm4aQIX9nlQ7aRfGg1ZixMG6l+8gu7Sckyl+F+7K5BHVo+xmrfiNjck
         WdskY7X/1t+sSetblRXU3h22HLyT1EvLrJYB0TRhbRd/DI5BJ3+9dmEjQipC9yxJeACD
         9Pgyi/eXx39vVCO/DVLJIEn0TEmM3x+/NlFKSCJhOqhBmX420u1ZeQ0Ibi0dT+imTsa1
         tdd0TeZKVaM8Ysd2UaWA6geSv50XYaoTJlg9J1/ShhrD2qBxgHKZ+xGOzDillxX3tT1/
         n9aw==
X-Gm-Message-State: AOJu0Yz30WimWOyGa3QIvwr/l6C3D6sFcuZP1rLB8aAcpQCrLCJWEW4S
	lxcQedy7NFWQXolXicjv9wY=
X-Google-Smtp-Source: AGHT+IGHj3o1rJdDVkhmH3dnpR+HkuNRcMg0FhHb9HaV4TtjOEsT5NiLy2NonrlIEAaz/+Y5oKXUlA==
X-Received: by 2002:a05:6a21:35c2:b0:153:39d9:56fe with SMTP id ba2-20020a056a2135c200b0015339d956femr5314450pzc.47.1699533102110;
        Thu, 09 Nov 2023 04:31:42 -0800 (PST)
Received: from smtpclient.apple ([2401:e180:8821:59e0:e5cc:8803:56b9:e782])
        by smtp.gmail.com with ESMTPSA id g13-20020a17090ae58d00b00263b9e75aecsm1206722pjz.41.2023.11.09.04.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 04:31:41 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mining Lin <mimi05633@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v6 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Thu, 9 Nov 2023 20:31:29 +0800
Message-Id: <960A21A8-532E-4F61-B0CB-ED2C27D640D8@gmail.com>
References: <20231103231639fd4b631c@mail.local>
In-Reply-To: <20231103231639fd4b631c@mail.local>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: iPhone Mail (20G81)
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, mylin1@nuvoton.com, benjaminfair@google.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, KFLIN@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Alexandre,

Thanks for your comments.
The replies are as follow.

Thanks.
Best regard,
Mia

Sent from my iPhone

> On Nov 4, 2023, at 7:16 AM, Alexandre Belloni <alexandre.belloni@bootlin.c=
om> wrote:
>=20
> =EF=BB=BFOn 13/09/2023 09:37:19+0800, Mia Lin wrote:
>> The NCT3015Y-R and NCT3018Y-R use the same datasheet
>>    but have different topologies as follows.
>> - Topology (Only 1st i2c can set TWO bit and HF bit)
>>  In NCT3015Y-R,
>>    rtc 1st i2c is connected to a host CPU
>>    rtc 2nd i2c is connected to a BMC
>>  In NCT3018Y-R,
>>    rtc 1st i2c is connected to a BMC
>>    rtc 2nd i2c is connected to a host CPU
>> In order to be compatible with NCT3015Y-R and NCT3018Y-R,
>> - In probe,
>>  If part number is NCT3018Y-R, only set HF bit to 24-Hour format.
>>  Else, do nothing
>> - In set_time,
>>  If part number is NCT3018Y-R && TWO bit is 0,
>>     change TWO bit to 1, and restore TWO bit after updating time.
>>=20
>> Signed-off-by: Mia Lin <mimi05633@gmail.com>
>> ---
>> drivers/rtc/rtc-nct3018y.c | 52 +++++++++++++++++++++++++++++++++-----
>> 1 file changed, 46 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
>> index ed4e606be8e5..b006b58e15e2 100644
>> --- a/drivers/rtc/rtc-nct3018y.c
>> +++ b/drivers/rtc/rtc-nct3018y.c
>> @@ -23,6 +23,7 @@
>> #define NCT3018Y_REG_CTRL    0x0A /* timer control */
>> #define NCT3018Y_REG_ST        0x0B /* status */
>> #define NCT3018Y_REG_CLKO    0x0C /* clock out */
>> +#define NCT3018Y_REG_PART    0x21 /* part info */
>>=20
>> #define NCT3018Y_BIT_AF        BIT(7)
>> #define NCT3018Y_BIT_ST        BIT(7)
>> @@ -37,10 +38,12 @@
>> #define NCT3018Y_REG_BAT_MASK        0x07
>> #define NCT3018Y_REG_CLKO_F_MASK    0x03 /* frequenc mask */
>> #define NCT3018Y_REG_CLKO_CKE        0x80 /* clock out enabled */
>> +#define NCT3018Y_REG_PART_NCT3018Y    0x02
>>=20
>> struct nct3018y {
>>    struct rtc_device *rtc;
>>    struct i2c_client *client;
>> +    int part_num;
>> #ifdef CONFIG_COMMON_CLK
>>    struct clk_hw clkout_hw;
>> #endif
>> @@ -177,8 +180,27 @@ static int nct3018y_rtc_read_time(struct device *dev=
, struct rtc_time *tm)
>> static int nct3018y_rtc_set_time(struct device *dev, struct rtc_time *tm)=

>> {
>>    struct i2c_client *client =3D to_i2c_client(dev);
>> +    struct nct3018y *nct3018y =3D dev_get_drvdata(dev);
>>    unsigned char buf[4] =3D {0};
>> -    int err;
>> +    int err, flags;
>> +    int restore_flags =3D 0;
>> +
>> +    flags =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
>> +    if (flags < 0) {
>> +        dev_dbg(&client->dev, "Failed to read NCT3018Y_REG_CTRL.\n");
>> +        return flags;
>> +    }
>> +
>> +    /* Check and set TWO bit */
>> +    if ((nct3018y->part_num & NCT3018Y_REG_PART_NCT3018Y) && !(flags & N=
CT3018Y_BIT_TWO)) {
>> +        restore_flags =3D 1;
>> +        flags |=3D NCT3018Y_BIT_TWO;
>> +        err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, fla=
gs);
>> +        if (err < 0) {
>> +            dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n"=
);
>> +            return err;
>> +        }
>> +    }
>>=20
>>    buf[0] =3D bin2bcd(tm->tm_sec);
>>    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_SC, buf[0]);
>> @@ -212,6 +234,18 @@ static int nct3018y_rtc_set_time(struct device *dev,=
 struct rtc_time *tm)
>>        return -EIO;
>>    }
>>=20
>> +    /* Restore TWO bit */
>> +    if (restore_flags) {
>> +        if (nct3018y->part_num & NCT3018Y_REG_PART_NCT3018Y)
>> +            flags &=3D ~NCT3018Y_BIT_TWO;
>> +
>> +        err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, fla=
gs);
>> +        if (err < 0) {
>> +            dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n"=
);
>> +            return err;
>> +        }
>> +    }
>> +
>>    return err;
>> }
>>=20
>> @@ -479,11 +513,17 @@ static int nct3018y_probe(struct i2c_client *client=
)
>>        dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__);
>>    }
>>=20
>> -    flags =3D NCT3018Y_BIT_TWO;
>> -    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);=

>> -    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
>> -        return err;
>> +    nct3018y->part_num =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG=
_PART);
>> +    if (nct3018y->part_num < 0) {
>> +        dev_dbg(&client->dev, "Failed to read NCT3018Y_REG_PART.\n");
>> +        return nct3018y->part_num;
>> +    } else if (nct3018y->part_num & NCT3018Y_REG_PART_NCT3018Y) {
>=20
> This is a weird way to check as this will accept any value of
> NCT3018Y_REG_PART as long as bit 1 is set, is this really what you want?
=EF=BC=BBMia] Thanks for your comments. I=E2=80=99ll fix it.
>=20
>> +        flags =3D NCT3018Y_BIT_HF;
>> +        err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, fla=
gs);
>> +        if (err < 0) {
>> +            dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL.\n"=
);
>> +            return err;
>> +        }
>>    }
>>=20
>>    flags =3D 0;
>> --=20
>> 2.17.1
>>=20
>=20
> --=20
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
