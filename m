Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04966530B2E
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 11:00:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6BBD6vxcz3blX
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 19:00:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UZw/vJV2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UZw/vJV2; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6B9p40xxz305S
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 19:00:13 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id p4so22983852lfg.4
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 02:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RT1M9aqkbwA63MQnchS8s/33KgiJZVs9GXaf0mr/Gkc=;
 b=UZw/vJV2m95kWc3FZbQ+rMmUAiUG/AhUnkoFhkuh2sLWH2TJdWbNSFXWfgt1dhy7t+
 zYIzySVe2duntOJZbKwPxH6OSDXYpGXi2G0zqYCKNvtRtUOhD+Vrskqvh87Spfhx3Y4g
 qPyyXhgDqGRJURGLdCGNODHYhFJjVypRmJZx0gUQFMfFMG56iM3Ub6e53aiJ1FStJ40a
 sMSYSscq8mpModYLJSKke31b1CJt+AUjZTj6D2ycpJ+vnHABmXa8Z7d4qVdMjXN/coI5
 Ay+FfFnFR8Q4H3O7zRpRJRhpVBXkuPCwDByBh1q01WMOFydGyZAwNIyNhryTBmdQfzL0
 34Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RT1M9aqkbwA63MQnchS8s/33KgiJZVs9GXaf0mr/Gkc=;
 b=f+Nm30uANs1MgudZh1zWGJx3pXk2yQ/xJ32sHp9/ahdkMu1t+0ETqTXSpwfDwqyvbx
 KJX09KmCLhW01qFt5OwgOPPYwmqdSTYu88eMx6P6tK7OUv5MNxlOLQz5MF8g2bWwk8/S
 UBLv1Bu/PNDYj+9P1eO6o1bxLHqWco1lqlQLxUk1Jo85S5QyPVP+PY6ph97NWzR59rnI
 R8zmHLA0MDGOwndoq5PWBM1rVLjKA02uQqHFhOLf6LPwAwpJG8REZCy1fCeduybX/PL0
 De4VaIgzHSLpwsKNuez76pQ1tfpCIcAsFnyJ/pJVhHAPxRFTnrIYhL1qbn5d4vRL0xJ8
 VFRg==
X-Gm-Message-State: AOAM532VC5u8Q85Kf5lZ1GI4HLx7GjAZL42qr8/MeBeBCkiCYeOeZRC1
 yRuUOljkFltgjraq0tjNyjy3M+lKpgSmWPP02Yo=
X-Google-Smtp-Source: ABdhPJyNDvtP6hAFs0NEen/Hds+ysvFRJrxOFRJzaG4fNAHvsJVaoMk+BPPQCr1KS7pJw2xKWp+CCVe3EwpDP2UfhWk=
X-Received: by 2002:ac2:5f1c:0:b0:474:d376:336c with SMTP id
 28-20020ac25f1c000000b00474d376336cmr15180843lfq.22.1653296408966; Mon, 23
 May 2022 02:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220517092927.19537-1-ctcchien@nuvoton.com>
 <20220517092927.19537-4-ctcchien@nuvoton.com>
 <YoPzaSc/8BBVWWsB@mail.local>
 <CAHpyw9fw54hQrsPa4psbUs2VfBqHj+gMKDceL2N5k8_jU+434w@mail.gmail.com>
 <YoSuS+nFJoD4+oKM@mail.local>
In-Reply-To: <YoSuS+nFJoD4+oKM@mail.local>
From: Medad Young <medadyoung@gmail.com>
Date: Mon, 23 May 2022 16:59:56 +0800
Message-ID: <CAHpyw9eeqY8xPaF_APEb9WDns6z3G5EcvXH-j16JPu6iSoWYYA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RTC: nuvoton: Add NCT3018Y real time clock driver
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, YSCHU@nuvoton.com,
 Tomer Maimon <tmaimon77@gmail.com>, KWLIU@nuvoton.com,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, KFTING <KFTING@nuvoton.com>,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Alexandre,

thanks for your comments

Alexandre Belloni <alexandre.belloni@bootlin.com> =E6=96=BC 2022=E5=B9=B45=
=E6=9C=8818=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:29=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On 18/05/2022 11:11:00+0800, Medad Young wrote:
> > > > +config RTC_DRV_NCT3018Y
> > > > +     tristate "Nuvoton Real Time Clock"
> > >
> > > This definitively needs a better description
> >
> > OK, I will add a better description.
>
> To be clear, this needs at least the part number

OK, I will add part number

>
> > > > +     tm->tm_wday =3D buf[6] & 0x07;
> > > > +     tm->tm_mday =3D bcd2bin(buf[7] & 0x3F);
> > > > +     tm->tm_mon =3D bcd2bin(buf[8] & 0x1F) - 1 ; /* rtc mn 1-12 */
> > > > +     tm->tm_year =3D bcd2bin(buf[9]) + 100;
> > > > +
> > > > +     dev_dbg(&client->dev, "%s:s=3D%d, m=3D%d, hr=3D%d, md=3D%d, m=
=3D%d, yr=3D%d, wd=3D%d\n",
> > > > +             __func__, tm->tm_sec, tm->tm_min, tm->tm_hour, tm->tm=
_mday, tm->tm_mon,
> > > > +             tm->tm_year, tm->tm_wday);
> > > > +
>
> I forgot but this dev_dbg is not particularily useful as we have
> tracepoint in the core. However, if you want to keep it, please use
> %ptR.

I understood, maybe I can remove it.
>
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static int nct3018y_rtc_set_time(struct device *dev, struct rtc_ti=
me *tm)
> > > > +{
> > > > +     struct i2c_client *client =3D to_i2c_client(dev);
> > > > +     unsigned char buf[10] =3D {0};
> > > > +     int err;
> > > > +
> > > > +     dev_dbg(&client->dev, "%s:s=3D%d, m=3D%d, hr=3D%d, md=3D%d, m=
=3D%d, yr=3D%d, wd=3D%d\n",
> > > > +             __func__, tm->tm_sec, tm->tm_min, tm->tm_hour, tm->tm=
_mday, tm->tm_mon,
> > > > +             tm->tm_year, tm->tm_wday);
>
> Ditto

OK, I can remove it.

>
> > > > +
> > > > +     err =3D nct3018y_read_block_data(client, NCT3018Y_REG_CTRL, 1=
, buf);
> > > > +     if (err)
> > > > +             return err;
> > > > +
> > > > +     if (!(buf[0] & NCT3018Y_BIT_TWO)) {
> > > > +             dev_err(&client->dev,
> > > > +                     " TWO is not set.\n");
> > >
> > > This is not useful, what is TWO?
> >
> > TWO stands for Time Registers Write Ownership
> > for NCT3018Y, driver needs to set this bit before writing to other regi=
sters
> >
>
> Can't you simply set it forcefully here instead of erroring out?

I did set it forcefully in the probe function, so I will remove the
same operation here.

>
> > >
> > > > +             return -EINVAL;
> > > > +     }
> > > > +
> > > > +     /* hours, minutes and seconds */
> > > > +     buf[NCT3018Y_REG_SC] =3D bin2bcd(tm->tm_sec);
> > > > +     buf[NCT3018Y_REG_MN] =3D bin2bcd(tm->tm_min);
> > > > +     buf[NCT3018Y_REG_HR] =3D bin2bcd(tm->tm_hour);
> > > > +     buf[NCT3018Y_REG_DW] =3D tm->tm_wday & 0x07;
> > > > +     buf[NCT3018Y_REG_DM] =3D bin2bcd(tm->tm_mday);
> > > > +
> > > > +     /* month, 1 - 12 */
> > > > +     buf[NCT3018Y_REG_MO] =3D bin2bcd(tm->tm_mon+1);
> > > > +
> > > > +     /* year and century */
> > >
> > > Were is the century?
> >
> > I will update the comment, for there is no century.
> >
> > >
> > > > +     buf[NCT3018Y_REG_YR] =3D bin2bcd(tm->tm_year - 100);
> > > > +
> > > > +     return nct3018y_write_block_data(client, NCT3018Y_REG_SC, 10,=
 buf);
>
> So this overwrites the alarm which is something you must not do.

yes, I will correct it

>
> > > > +     buf[0] =3D bin2bcd(tm->time.tm_sec);
> > > > +     buf[1] =3D bin2bcd(tm->time.tm_min);
> > > > +     buf[2] =3D bin2bcd(tm->time.tm_hour);
> > > > +
> > > > +     err =3D nct3018y_write_block_data(client, NCT3018Y_REG_SCA, 1=
, buf);
> > > > +     if (err)
> > > > +             return err;
> > >
> > >
> > > Writing byte per byte opens a huge window for a race condition here.
> > >
> >
> > I write byte per byte,
> > because these three registers are not continuous
> >
>
> Right, I did see it and then forgot.

thanks

>
> > > > +     nct3018y->rtc =3D devm_rtc_allocate_device(&client->dev);
> > > > +     if (IS_ERR(nct3018y->rtc))
> > > > +             return PTR_ERR(nct3018y->rtc);
> > > > +
> > > > +     nct3018y->rtc->ops =3D &nct3018y_rtc_ops;
> > > > +     nct3018y->rtc->range_min =3D RTC_TIMESTAMP_BEGIN_2000;
> > > > +     nct3018y->rtc->range_max =3D RTC_TIMESTAMP_END_2099;
> > > > +     nct3018y->rtc->set_start_time =3D true;
> > >
> > > Do you have a good reason to set set_start_time here?
> > >
> >
> > Sorry, I am new here.
> > I just follow other drivers.
> > so you think I should not set set_start_time, right?
> >
>
> There are very few drivers that needs it, when they used to window the
> dates they support back to 1970 which is not something you seem to care
> about.

I got it.


>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

B.R.
Medad
