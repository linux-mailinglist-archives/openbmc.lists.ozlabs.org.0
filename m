Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7D077C60F
	for <lists+openbmc@lfdr.de>; Tue, 15 Aug 2023 04:46:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IrYqikNG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPwdR5WLKz30dt
	for <lists+openbmc@lfdr.de>; Tue, 15 Aug 2023 12:46:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=IrYqikNG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=mimi05633@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPwct1MJjz2ytX
	for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2023 12:46:04 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1bdc8081147so17229025ad.1
        for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2023 19:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692067561; x=1692672361;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBQ92kohH7JMrCClRaKPkEsOhf96ZT5UADuYTehrlmU=;
        b=IrYqikNG70bqTMekq6S8AERUH06zWR7D8dR4b1se1DivMCv98aFt60wB0YFS2qGe5F
         FctUoRWZ5IVHWLjwBDqsvzSRcHMuYobDAlqeZ10INv7hVB8A5a6p8Fs+zVIBju2SFpnC
         +7pJuXc8Zc98RvhgUTvMEwjKezCaHHX52beeDkhGEZYGf1ibgM9hR9QRuNXaAcLv/teF
         pPWwVRY3Qo25T9SHagFPmMjk/0sQCXX1gIjUfeXNcq/PyOdOXqL4h86YQ/mnjN7TwAvr
         8yjaWKr6UgXUoj4bMBDRNRNfNvfALfQsKKscx4VOvjqE7MchRvhHT1aOkk0STNzH/m7Y
         dZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692067561; x=1692672361;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wBQ92kohH7JMrCClRaKPkEsOhf96ZT5UADuYTehrlmU=;
        b=IKZR64IRmBQOZLiOOuy/SK26c2YrOKRHD0rbYyIPVLKuxZnpxhDygsIdeRuHfDtBjd
         p4/PPoq4Lts7dXSr6sUQbMzrBa5hdfEVYucYcn+v0p6cPqjkYBCNTGWsNvLOp11iAcEX
         4gzG1ftMVUCtGB2BeRMom2QUsn+SSYdiyqu/KtGlbir1E4eb1UC4Dr41tE1rTekFoNGN
         thozG7FEhd8X9ZHQ2QmZO8isK4EhO0ZRD1N+nmgTbFKkeARVDZhhw/LryBJiYCRzyyUf
         nmFO30Nfd7YVwoiFFZHvXdw4pvJkouN+T0Y/+8Rk0H3U6kbLJf+ovcabDyrwJo3woDbL
         N68g==
X-Gm-Message-State: AOJu0YwucocDU+8FapzhS8ZNw1/DmKcWJz378+lY8XsqAPMnWpsq7G18
	eAVBBSs9P7kvK/dfORKVPc0=
X-Google-Smtp-Source: AGHT+IHQ8UZ6DdrRyAirju3lt0PmovMHo8QZvirQPOeY21h6YU4yAN8uyMmHAh7XDW/huVq8TXVsNQ==
X-Received: by 2002:a17:902:ecce:b0:1b0:3ab6:5140 with SMTP id a14-20020a170902ecce00b001b03ab65140mr1132925plh.4.1692067560990;
        Mon, 14 Aug 2023 19:46:00 -0700 (PDT)
Received: from smtpclient.apple ([2401:e180:88a1:80ef:f4f9:717b:5cd:3109])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902d38400b001bdc9daadc9sm5834170pld.89.2023.08.14.19.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 19:46:00 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mining Lin <mimi05633@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 2/2] rtc: nuvoton: Compatible with NCT3015Y-R and NCT3018Y-R
Message-Id: <295A0B20-FB6F-4858-8B25-6C5E8357DEBB@gmail.com>
Date: Tue, 15 Aug 2023 10:45:48 +0800
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com, benjaminfair@google.com, KWLIU@nuvoton.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, conor+dt@kernel.org, tali.perry1@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, mylin1@nuvoton.com, krzysztof.kozlowski+dt@linaro.org, KFLIN@nuvoton.com, linux-kernel@vger.kernel.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

=EF=BB=BFDear Paul,

Thank you for your comments.
The replies are as follows.

Thanks.
Best regard,
Mia

> On Aug 10, 2023, at 4:16 PM, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>=20
> =EF=BB=BFDear Mia,
>=20
>=20
> Thank you for your patch.
>=20
> It=E2=80=99d be great if you made the commit message summary/title more sp=
ecific. Maybe:
>=20
> Add support for NCT3015Y-R
>=20
> Am 09.08.23 um 11:51 schrieb Mia Lin:
>=20
> An introduction what the NCT3015Y-R is and listing the differences to NCT3=
018Y-R would be nice.
[Mia] I will add more detail. Thank you for your comments.
>=20
>> - In probe,
>> If part number is NCT3018Y-R, only set HF bit to 24-Hour format.
>> Else, do nothing
>> - In set_time,
>> If part number is NCT3018Y-R && TWO bit is 0,
>> change TWO bit to 1, and restore TWO bit after updating time.
>=20
> Why? This also looks unrelated to the NCT3015Y-R support. Could you factor=
 it out into separate patch?
[Mia] The NCT3015Y-R and NCT3018Y-R use the same datasheet but have differen=
t topologies.
Therefore, the settings here are to set according to different models to mat=
ch the behavior of each chip.
>=20
>> - Use DT compatible to check the chip matches or not.
>=20
> Could you please add the datasheet name and revision?
[Mia] Use DT compatible to check does not make sense. I will remove it.
>=20
>> Signed-off-by: Mia Lin <mimi05633@gmail.com>
>> ---
>> drivers/rtc/rtc-nct3018y.c | 88 +++++++++++++++++++++++++++++++++-----
>> 1 file changed, 78 insertions(+), 10 deletions(-)
>> diff --git a/drivers/rtc/rtc-nct3018y.c b/drivers/rtc/rtc-nct3018y.c
>> index a4e3f924837e..edc73be3ab59 100644
>> --- a/drivers/rtc/rtc-nct3018y.c
>> +++ b/drivers/rtc/rtc-nct3018y.c
>> @@ -7,6 +7,7 @@
>> #include <linux/i2c.h>
>> #include <linux/module.h>
>> #include <linux/of.h>
>> +#include <linux/of_device.h>
>> #include <linux/rtc.h>
>> #include <linux/slab.h>
>> @@ -23,6 +24,7 @@
>> #define NCT3018Y_REG_CTRL    0x0A /* timer control */
>> #define NCT3018Y_REG_ST        0x0B /* status */
>> #define NCT3018Y_REG_CLKO    0x0C /* clock out */
>> +#define NCT3018Y_REG_PART    0x21 /* part info */
>> #define NCT3018Y_BIT_AF        BIT(7)
>> #define NCT3018Y_BIT_ST        BIT(7)
>> @@ -37,6 +39,20 @@
>> #define NCT3018Y_REG_BAT_MASK        0x07
>> #define NCT3018Y_REG_CLKO_F_MASK    0x03 /* frequenc mask */
>> #define NCT3018Y_REG_CLKO_CKE        0x80 /* clock out enabled */
>> +#define NCT3018Y_REG_PART_NCT3015Y    0x01
>> +#define NCT3018Y_REG_PART_NCT3018Y    0x02
>> +
>> +struct rtc_data {
>> +    u8 part_number;
>> +};
>> +
>> +static const struct rtc_data nct3015y_rtc_data =3D {
>> +    .part_number =3D NCT3018Y_REG_PART_NCT3015Y,
>> +};
>> +
>> +static const struct rtc_data nct3018y_rtc_data =3D {
>> +    .part_number =3D NCT3018Y_REG_PART_NCT3018Y,
>> +};
>> struct nct3018y {
>>  struct rtc_device *rtc;
>> @@ -52,7 +68,7 @@ static int nct3018y_set_alarm_mode(struct i2c_client *c=
lient, bool on)
>>    dev_dbg(&client->dev, "%s:on:%d\n", __func__, on);
>> -    flags =3D  i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
>> +    flags =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
>>  if (flags < 0) {
>>      dev_dbg(&client->dev,
>>          "Failed to read NCT3018Y_REG_CTRL\n");
>> @@ -109,8 +125,10 @@ static int nct3018y_get_alarm_mode(struct i2c_client=
 *client, unsigned char *ala
>>      *alarm_flag =3D flags & NCT3018Y_BIT_AF;
>>  }
>> -    dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
>> -        __func__, *alarm_enable, *alarm_flag);
>> +    if (alarm_enable && alarm_flag) {
>> +        dev_dbg(&client->dev, "%s:alarm_enable:%x alarm_flag:%x\n",
>> +            __func__, *alarm_enable, *alarm_flag);
>> +    }
>=20
> The two hunks look like unrelated fixes. It=E2=80=99d be great, if you fac=
tored those out into a separate patch.
[Mia] I will factor it out into a separate patch.
>=20
>>    return 0;
>> }
>> @@ -178,7 +196,30 @@ static int nct3018y_rtc_set_time(struct device *dev,=
 struct rtc_time *tm)
>> {
>>  struct i2c_client *client =3D to_i2c_client(dev);
>>  unsigned char buf[4] =3D {0};
>> -    int err;
>> +    int err, part_num, flags, restore_flags =3D 0;
>=20
> Why is err now initialized to 0?
[Mia] I will refine it.
>=20
>> +    part_num =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
>> +    if (part_num < 0) {
>> +        dev_dbg(&client->dev, "%s: read error\n", __func__);
>> +        return part_num;
>> +    }
>> +
>> +    flags =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG_CTRL);
>> +    if (flags < 0) {
>> +        dev_dbg(&client->dev, "%s: read error\n", __func__);
>=20
> Could you make these distinct error messages, so users are able to pinpoin=
t the correct location right away? (Or does `dev_dbg` already provide that i=
nformation? Maybe the line? (Also more cases below.)
[Mia] I will refine error messages. Thank you.
>=20
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
>> +            dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n")=
;
>> +            return err;
>> +        }
>> +    }
>>    buf[0] =3D bin2bcd(tm->tm_sec);
>>  err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_SC, buf[0]);
>> @@ -212,6 +253,18 @@ static int nct3018y_rtc_set_time(struct device *dev,=
 struct rtc_time *tm)
>>      return -EIO;
>>  }
>> +    /* Restore TWO bit */
>> +    if (restore_flags) {
>> +        if (part_num & NCT3018Y_REG_PART_NCT3018Y)
>> +            flags &=3D ~NCT3018Y_BIT_TWO;
>> +
>> +        err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, fla=
gs);
>> +        if (err < 0) {
>> +            dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n")=
;
>> +            return err;
>> +        }
>> +    }
>> +
>>  return err;
>> }
>> @@ -456,6 +509,7 @@ static int nct3018y_probe(struct i2c_client *client)
>> {
>>  struct nct3018y *nct3018y;
>>  int err, flags;
>> +    const struct rtc_data *data =3D of_device_get_match_data(&client->de=
v);
>>    if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
>>                   I2C_FUNC_SMBUS_BYTE |
>> @@ -479,11 +533,24 @@ static int nct3018y_probe(struct i2c_client *client=
)
>>      dev_dbg(&client->dev, "%s: NCT3018Y_BIT_TWO is set\n", __func__);
>>  }
>> -    flags =3D NCT3018Y_BIT_TWO;
>> -    err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, flags);=

>> -    if (err < 0) {
>> -        dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n");
>> -        return err;
>> +    flags =3D i2c_smbus_read_byte_data(client, NCT3018Y_REG_PART);
>> +    if (flags < 0) {
>> +        dev_dbg(&client->dev, "%s: read error\n", __func__);
>> +        return flags;
>> +    } else if (flags & NCT3018Y_REG_PART_NCT3018Y) {
>> +        if (!(flags & data->part_number))
>> +            dev_warn(&client->dev, "%s: part_num=3D0x%x but NCT3018Y_REG=
_PART=3D0x%x\n",
>> +                 __func__, data->part_number, flags);
>> +        flags =3D NCT3018Y_BIT_HF;
>> +        err =3D i2c_smbus_write_byte_data(client, NCT3018Y_REG_CTRL, fla=
gs);
>> +        if (err < 0) {
>> +            dev_dbg(&client->dev, "Unable to write NCT3018Y_REG_CTRL\n")=
;
>> +            return err;
>> +        }
>> +    } else if (flags & NCT3018Y_REG_PART_NCT3015Y) {
>> +        if (!(flags & data->part_number))
>> +            dev_warn(&client->dev, "%s: part_num=3D0x%x but NCT3018Y_REG=
_PART=3D0x%x\n",
>> +                 __func__, data->part_number, flags);
>>  }
>>    flags =3D 0;
>> @@ -530,7 +597,8 @@ static const struct i2c_device_id nct3018y_id[] =3D {=

>> MODULE_DEVICE_TABLE(i2c, nct3018y_id);
>> static const struct of_device_id nct3018y_of_match[] =3D {
>> -    { .compatible =3D "nuvoton,nct3018y" },
>> +    { .compatible =3D "nuvoton,nct3015y", .data =3D &nct3015y_rtc_data }=
,
>> +    { .compatible =3D "nuvoton,nct3018y", .data =3D &nct3018y_rtc_data }=
,
>>  {}
>> };
>> MODULE_DEVICE_TABLE(of, nct3018y_of_match);
>=20
>=20
> Kind regards,
>=20
> Paul
