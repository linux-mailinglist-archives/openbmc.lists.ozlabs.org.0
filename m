Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6923B793350
	for <lists+openbmc@lfdr.de>; Wed,  6 Sep 2023 03:20:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rioaGZXq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgPgj1Z3pz3c1P
	for <lists+openbmc@lfdr.de>; Wed,  6 Sep 2023 11:20:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rioaGZXq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgPg60nGtz2ygq
	for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2023 11:19:44 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6c09f1f4610so394653a34.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2023 18:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693963181; x=1694567981; darn=lists.ozlabs.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0W55U5dkDtWOdXQ18nuxk1kw/1nO1uoqQOX3LJ5eFjs=;
        b=rioaGZXq4UgYNGhgEiYvXmzAk30wC54tBm7YVocMeYp1czBRyvAQSexBYLK3CW9eed
         7RWJbBFFt9t7/WzdYH45Q71JsrS9WoJoB4SZAZw+6V1FuSH60+cKDw6iJBh1ub8CWaW9
         8N7kfNHLwY08m5bxtsfAzNp3HMgElWynDVLVk7ETC9KQGBB2EZknCavWpRdexjBai3HX
         3j+n2xhC6vqON9HvvhbR7zagtxHc6CkvCqCds6aS4oTZTeOgKy0l/BkHxQ9YuNVI8ipI
         s9tka5EXc8vHbZWzNUY8KlcDMFUU9tOqEmP3J9U5/9zam5UIS7PtY7SquoBJqq7m+5hK
         Qk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693963181; x=1694567981;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0W55U5dkDtWOdXQ18nuxk1kw/1nO1uoqQOX3LJ5eFjs=;
        b=KsU2X9Bs9O01ZmTeQGdvUG/rj6XPfTDxi4ZsUWAC416aQ4zkD5/Iiq3hE0AGqkFo9x
         qifgnTBB9wsBCrM5PWZ5SVhi1e1IDJaNpL8UJk8Sq5VyJ6tI4VfxET0hFnQx1D31IS4V
         id9RDgQgNrbVsU9ZteUX4nId2stsr7/pPG3EQVrZqGzgR/ZIQA3mXug8nlqbnKAv4RgG
         zuny1dFViH+2cLv7AAxrbba/l9WQNB0ObNz+wT0dfZYaAw56u4xc0VGkTztfu2dN4Nbh
         VdH5qDh8vsYbt1hHmT0pxMaKrlLFZ3WmnGzk2XIKk3rcjERnZ0UPhLa1y7/8v0O3NPBE
         GCCA==
X-Gm-Message-State: AOJu0Yzar0nGSzJc+3frpn+q189xQDJ3Kgvo7X3Km7zQmZFu/4KGtTvt
	JjMtK5G6mtgHKlXknqECL+c=
X-Google-Smtp-Source: AGHT+IHUqIIfqH6hHVZT5nenrjqak3YLcIQPeKu8Rfz5D5SxRToO9MysRXt2zHBfuYzGWKBwZNR4JA==
X-Received: by 2002:a9d:7dd3:0:b0:6b7:56d9:533 with SMTP id k19-20020a9d7dd3000000b006b756d90533mr13624755otn.28.1693963181447;
        Tue, 05 Sep 2023 18:19:41 -0700 (PDT)
Received: from smtpclient.apple ([2401:e180:8850:2f48:dd19:4847:5d6f:9042])
        by smtp.gmail.com with ESMTPSA id bt19-20020a632913000000b0056129129ef8sm9870964pgb.18.2023.09.05.18.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 18:19:41 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mining Lin <mimi05633@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v5 1/1] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Date: Wed, 6 Sep 2023 09:19:29 +0800
Message-Id: <D6734DA5-839E-40A6-9085-F25BB8D70022@gmail.com>
References: <202309050635059ecd17a2@mail.local>
In-Reply-To: <202309050635059ecd17a2@mail.local>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: iPhone Mail (20G75)
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

>=20
> On Sep 5, 2023, at 2:35 PM, Alexandre Belloni <alexandre.belloni@bootlin.c=
om> wrote:
>=20
> =EF=BB=BFOn 05/09/2023 14:03:41+0800, Mia Lin wrote:
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
>> - Refine error messages to pinpoint the correct location.
>>=20
>> Signed-off-by: Mia Lin <mimi05633@gmail.com>
>> ---
>> drivers/rtc/rtc-nct3018y.c | 87 ++++++++++++++++++++++++++++----------
>> 1 file changed, 64 insertions(+), 23 deletions(-)
>>=20
>> diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
>> index a4e3f924837e..9ec20f241e15 100644
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
>> @@ -37,6 +38,7 @@
>> #define NCT3018Y_REG_BAT_MASK        0x07
>> #define NCT3018Y_REG_CLKO_F_MASK    0x03 /* frequenc mask */
>> #define NCT3018Y_REG_CLKO_CKE        0x80 /* clock out enabled */
>> +#define NCT3018Y_REG_PART_NCT3018Y    0x02
>>=20
>> struct nct3018y {
>>    struct rtc_device *rtc;
>> @@ -46,6 +48,8 @@ struct nct3018y {
>> #endif
>> };
>>=20
>> +static int part_num;
>> +
>=20
> This must be part of struct nct3018y.
[Mia] I will move the part number parameter to struct nct3018y.
>=20
>> static int nct3018y_set_alarm_mode(struct i2c_client *client, bool on)
>> {
>>    int err, flags;
>> @@ -55,7 +59,7 @@ static int nct3018y_set_alarm_mode(struct i2c_client *c=
lient, bool on)
>>    flags =3D  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
>>    if (flags < 0) {
>>        dev_dbg(&client->dev,
>> -            "Failed to read NCT3018Y_REG_CTRL\n");
>> +            "%s: Failed to read ctrl reg.\n", __func__);
>=20
> If you really insist on this change, what about:
>=20
> #define pr_fmt(fmt) "%s: " fmt, __func__
[Mia] Do you mean to replace dev_dbg with pr_debug? If yes, for consistency,=
 I'm going to refine all messages via pr_debug. Thank you for your suggestio=
n.

>>        return flags;
>>    }
>>=20
>> @@ -67,21 +71,21 @@ static int nct3018y_set_alarm_mode(struct i2c_client *=
client, bool on)
>>    flags |=3D NCT3018Y_BIT_CIE;
>>    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
>> +        dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __func_=
_);
>>        return err;
>>    }
>>=20
>>    flags =3D  i2c_smbus_read_byte_data(client, NCT3018Y_REG_ST);
>>    if (flags < 0) {
>>        dev_dbg(&client->dev,
>> -            "Failed to read NCT3018Y_REG_ST\n");
>> +            "%s: Failed to read status reg.\n", __func__);
>>        return flags;
>>    }
>>=20
>>    flags &=3D ~(NCT3018Y_BIT_AF);
>>    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_ST\n");
>> +        dev_dbg(&client->dev, "%s: Unable to write status reg.\n", __fun=
c__);
>>        return err;
>>    }
>>=20
>> @@ -155,7 +159,7 @@ static int nct3018y_rtc_read_time(struct device *dev,=
 struct rtc_time *tm)
>>        return err;
>>=20
>>    if (!buf[0]) {
>> -        dev_dbg(&client->dev, " voltage <=3D1.7, date/time is not reliab=
le.\n");
>> +        dev_dbg(&client->dev, "%s: voltage <=3D1.7, date/time is not rel=
iable.\n", __func__);
>>        return -EINVAL;
>>    }
>>=20
>> @@ -178,26 +182,44 @@ static int nct3018y_rtc_set_time(struct device *dev=
, struct rtc_time *tm)
>> {
>>    struct i2c_client *client =3D to_i2c_client(dev);
>>    unsigned char buf[4] =3D {0};
>> -    int err;
>> +    int err, flags;
>> +    int restore_flags =3D 0;
>> +
>> +    flags =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
>> +    if (flags < 0) {
>> +        dev_dbg(&client->dev, "%s: Failed to read ctrl reg.\n", __func__=
);
>> +        return flags;
>> +    }
>> +
>> +    /* Check and set TWO bit */
>> +    if ((part_num & NCT3018Y_REG_PART_NCT3018Y) && !(flags & NCT3018Y_BI=
T_TWO)) {
>> +        restore_flags =3D 1;
>> +        flags |=3D NCT3018Y_BIT_TWO;
>> +        err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, fla=
gs);
>> +        if (err < 0) {
>> +            dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __f=
unc__);
>> +            return err;
>> +        }
>> +    }
>>=20
>>    buf[0] =3D bin2bcd(tm->tm_sec);
>>    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_SC, buf[0]);
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_SC\n");
>> +        dev_dbg(&client->dev, "%s: Unable to write seconds reg.\n", __fu=
nc__);
>>        return err;
>>    }
>>=20
>>    buf[0] =3D bin2bcd(tm->tm_min);
>>    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_MN, buf[0]);
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_MN\n");
>> +        dev_dbg(&client->dev, "%s: Unable to write minutes reg.\n", __fu=
nc__);
>>        return err;
>>    }
>>=20
>>    buf[0] =3D bin2bcd(tm->tm_hour);
>>    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_HR, buf[0]);
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_HR\n");
>> +        dev_dbg(&client->dev, "%s: Unable to write hour reg.\n", __func_=
_);
>>        return err;
>>    }
>>=20
>> @@ -208,10 +230,22 @@ static int nct3018y_rtc_set_time(struct device *dev=
, struct rtc_time *tm)
>>    err =3D i2c_smbus_write_i2c_block_data(client, NCT3018Y_REG_DW,
>>                         sizeof(buf), buf);
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write for day and mon and year\=
n");
>> +        dev_dbg(&client->dev, "%s: Unable to write for day and mon and y=
ear.\n", __func__);
>>        return -EIO;
>>    }
>>=20
>> +    /* Restore TWO bit */
>> +    if (restore_flags) {
>> +        if (part_num & NCT3018Y_REG_PART_NCT3018Y)
>> +            flags &=3D ~NCT3018Y_BIT_TWO;
>> +
>> +        err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, fla=
gs);
>> +        if (err < 0) {
>> +            dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __f=
unc__);
>> +            return err;
>> +        }
>> +    }
>> +
>>    return err;
>> }
>>=20
>> @@ -224,7 +258,7 @@ static int nct3018y_rtc_read_alarm(struct device *dev=
, struct rtc_wkalrm *tm)
>>    err =3D i2c_smbus_read_i2c_block_data(client, NCT3018Y_REG_SCA,
>>                        sizeof(buf), buf);
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to read date\n");
>> +        dev_dbg(&client->dev, "%s: Unable to read date.\n", __func__);
>>        return -EIO;
>>    }
>>=20
>> @@ -257,19 +291,19 @@ static int nct3018y_rtc_set_alarm(struct device *de=
v, struct rtc_wkalrm *tm)
>>=20
>>    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_SCA, bin2bcd(tm=
->time.tm_sec));
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_SCA\n");
>> +        dev_dbg(&client->dev, "%s: Unable to write seconds alarm reg.\n"=
, __func__);
>>        return err;
>>    }
>>=20
>>    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_MNA, bin2bcd(tm=
->time.tm_min));
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_MNA\n");
>> +        dev_dbg(&client->dev, "%s: Unable to write minutes alarm reg.\n"=
, __func__);
>>        return err;
>>    }
>>=20
>>    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_HRA, bin2bcd(tm=
->time.tm_hour));
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_HRA\n");
>> +        dev_dbg(&client->dev, "%s: Unable to write hour alarm reg.\n", _=
_func__);
>>        return err;
>>    }
>>=20
>> @@ -473,23 +507,29 @@ static int nct3018y_probe(struct i2c_client *client=
)
>>=20
>>    flags =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
>>    if (flags < 0) {
>> -        dev_dbg(&client->dev, "%s: read error\n", __func__);
>> +        dev_dbg(&client->dev, "%s: Failed to read ctrl reg.\n", __func__=
);
>>        return flags;
>>    } else if (flags & NCT3018Y_BIT_TWO) {
>> -        dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__)=
;
>> +        dev_dbg(&client->dev, "%s: TWO bit is set.\n", __func__);
>>    }
>>=20
>> -    flags =3D NCT3018Y_BIT_TWO;
>> -    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);=

>> -    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
>> -        return err;
>> +    part_num =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
>> +    if (part_num < 0) {
>> +        dev_dbg(&client->dev, "%s: Failed to read part info reg.\n", __f=
unc__);
>> +        return part_num;
>> +    } else if (part_num & NCT3018Y_REG_PART_NCT3018Y) {
>> +        flags =3D NCT3018Y_BIT_HF;
>> +        err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, fla=
gs);
>> +        if (err < 0) {
>> +            dev_dbg(&client->dev, "%s: Unable to write ctrl reg.\n", __f=
unc__);
>> +            return err;
>> +        }
>>    }
>>=20
>>    flags =3D 0;
>>    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_ST, flags);
>>    if (err < 0) {
>> -        dev_dbg(&client->dev, "%s: write error\n", __func__);
>> +        dev_dbg(&client->dev, "%s: Failed to clear status reg.\n", __fun=
c__);
>>        return err;
>>    }
>>=20
>> @@ -507,7 +547,8 @@ static int nct3018y_probe(struct i2c_client *client)
>>                        IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
>>                        "nct3018y", client);
>>        if (err) {
>> -            dev_dbg(&client->dev, "unable to request IRQ %d\n", client->=
irq);
>> +            dev_dbg(&client->dev, "%s: Unable to request IRQ %d.\n",
>> +                __func__, client->irq);
>>            return err;
>>        }
>>    } else {
>> --=20
>> 2.17.1
>>=20
>=20
> --=20
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
