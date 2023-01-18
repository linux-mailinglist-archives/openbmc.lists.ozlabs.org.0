Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF88F671242
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 04:56:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxX4T4BlPz3c9R
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 14:56:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=hf3jwcSM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=hf3jwcSM;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxX3v2RZsz3bbc
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 14:55:53 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id ud5so80250063ejc.4
        for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2023 19:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcT5Z2kZpgpCs/H5CSpJUBKOlxzXUkwsQ72IKLNAM6A=;
        b=hf3jwcSM3LErt5VoJyNZ76KtqHK0KCmJ/4wD6UGyTKAskIHSoCayvjIqXKFdK7Qwni
         e2UwyP6TmHAM3aNlLBudDYPe5aTULyjuDG1Wn0wMV0irHHqAu+SSNd1e4fKE0pTrlZLn
         64zhHySdv9XAhiBTQgoFL8h5IyS0kswCoOBLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcT5Z2kZpgpCs/H5CSpJUBKOlxzXUkwsQ72IKLNAM6A=;
        b=hi4tkkVuVJikMg5xVtan03G0bjhUjXJMmi6opxdRNrgunHOY3WxNhJlGyf8sObc+pv
         4jmNJAIrba1Rb4UWFT+KN7VbKLWE4ZeGq/GxLW5illAEhowULzcM5pvUPY4cttka4ahY
         wk2Te0KnVb1HUzGzfcv6y43pCgzf3JNacfjfRK4QqC5XykgAeipw0+5C9UiZ7vBY/JUQ
         hjbYFFocjIRu+m1Eed52F91iqyq7/nnAXQE2MiVr3ypubhnK8riw0FYcC8yy505vfNDg
         VI4EKfVwmtcBlhXksSns7vVHR812wRFTIky0Kw5y9DXEPGC1yDjSjWiCMDa/nQ2LdDsW
         qGAA==
X-Gm-Message-State: AFqh2krJ5IKHv+RBa/DrGMeNihWAUbPtmluYJQL4pF0IzXVHclDy9jSX
	uLxeM0IxtXPiSl3DggVzlQzezTWdDBGbljrZaP0=
X-Google-Smtp-Source: AMrXdXt0hc10x0K73L0tm5fBfFF0XWK8jWggYbaXH1vOomxPm7E4QvIL+XpCg+PT91fmDey6NxJPSsQIXxL8ZRi+FHs=
X-Received: by 2002:a17:906:ecb9:b0:86d:97d4:9fea with SMTP id
 qh25-20020a170906ecb900b0086d97d49feamr701815ejb.141.1674014149868; Tue, 17
 Jan 2023 19:55:49 -0800 (PST)
MIME-Version: 1.0
References: <20221209024522.2102509-1-wangxiaohua.1217@bytedance.com> <c319b24e-a2bf-9516-5ae3-1b7da73862f7@roeck-us.net>
In-Reply-To: <c319b24e-a2bf-9516-5ae3-1b7da73862f7@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jan 2023 03:55:37 +0000
Message-ID: <CACPK8Xekz5LPqMH4_2cT2gg3NtoPt0rjM6ZY=8XccytMoaN=Bw@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0 v3] pmbus: Add mp2971/mp2973 support in mp2975
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, Wang Xiaohua <wangxiaohua.1217@bytedance.com>, openbmc@lists.ozlabs.org, jdelvare@suse.com, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Xiaohua,


On Sat, 10 Dec 2022 at 17:54, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 12/8/22 18:45, Wang Xiaohua wrote:
> > Add mp2971/mp2973 support in mp2975

Guenter has some comments for you to address. Are you planning on
working on this further?

I would like to help you get support for this device in the tree, but
it will require some more work.

Cheers,

Joel

> >
> > Tested with:
> > My unit only include mp2971 and mp2973 devices
> > MP2973:
> > cat /sys/bus/i2c/devices/5-0076/hwmon/hwmon24/*label
> > iin
> > iout1
> > iout2
> > vin
> > vout1
> > vout2
> > pin
> > pout1
> > pout2
> > cat /sys/bus/i2c/devices/5-0076/hwmon/hwmon24/*input
> > 0
> > 82500
> > 14000
> > 12187
> > 1787
> > 1793
> > 0
> > 148000000
> > 25000000
> > 54000
> > MP2971:
> > cat /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*label
> > iin
> > iout1
> > iout2
> > vin
> > vout1
> > vout2
> > pin
> > pout1
> > pout2
> > cat /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*input
> > 18500
> > 22000
> > 500
> > 12187
> > 1025
> > 1800
> > 226000000
> > 22000000
> > 1000000
> > 55000
> >
>
> Test results are not very useful. Better use something like
> "grep . /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*".
>
> Either case, test results should be provided after "---" and not be part
> of the commit description. Instead, the commit description should explain
> what those chips actually are.
>
>
> > Signed-off-by: Wang Xiaohua <wangxiaohua.1217@bytedance.com>
> >
> > v2:
> > - Fix auto build test WARNING
> >
> > v3:
> > - Fix incorrect return code
> > ---
> >   drivers/hwmon/pmbus/mp2975.c | 415 +++++++++++++++++++++++++++++++---=
-
> >   1 file changed, 374 insertions(+), 41 deletions(-)
> >
>
> Update to Documentation/hwmon/mp2975.rst and
> Documentation/devicetree/bindings/trivial-devices.yaml required.
>
> However, there is a more severe problem: The changes are too complex
> for me to review, and the chip datasheets are not published. I can not ev=
aluate
> if the changes are really needed, if there is a less complex solution,
> or if they even make sense. Someone with access to a datasheet will have
> to step up as maintainer for this driver.
>
> Additional comments inline.
>
> Guenter
>
> > diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.=
c
> > index 51986adfbf47..4d1b7ac1800e 100644
> > --- a/drivers/hwmon/pmbus/mp2975.c
> > +++ b/drivers/hwmon/pmbus/mp2975.c
> > @@ -52,10 +52,33 @@
> >   #define MP2975_MAX_PHASE_RAIL2      4
> >   #define MP2975_PAGE_NUM             2
> >
> > +#define MP2971_RAIL2_FUNC                                             =
         \
> > +     (PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |    =
      \
> > +      PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT)
> > +
> >   #define MP2975_RAIL2_FUNC   (PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT=
 | \
> >                                PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT=
 | \
> >                                PMBUS_HAVE_POUT | PMBUS_PHASE_VIRTUAL)
> >
> > +struct mp2971_device_info {
> > +     int max_phase_rail1;
> > +     int max_phase_rail2;
> > +     int imvp9_en_r1_mask;
> > +     int imvp9_en_r2_mask;
> > +};
> > +
> > +struct mp2971_data {
> > +     struct pmbus_driver_info info;
> > +     int vid_step[MP2975_PAGE_NUM];
> > +     int vout_format[MP2975_PAGE_NUM];
> > +     int vout_mode[MP2975_PAGE_NUM];
> > +     int vout_exponent[MP2975_PAGE_NUM];
> > +     int max_phase_rail1;
> > +     int max_phase_rail2;
> > +     int imvp9_en_r1_mask;
> > +     int imvp9_en_r2_mask;
> > +};
> > +
> >   struct mp2975_data {
> >       struct pmbus_driver_info info;
> >       int vout_scale;
> > @@ -68,6 +91,9 @@ struct mp2975_data {
> >       int curr_sense_gain[MP2975_PAGE_NUM];
> >   };
> >
> > +static const struct i2c_device_id mp2975_id[];
> > +
> > +#define to_mp2971_data(x) container_of(x, struct mp2971_data, info)
> >   #define to_mp2975_data(x)  container_of(x, struct mp2975_data, info)
> >
> >   static int mp2975_read_byte_data(struct i2c_client *client, int page,=
 int reg)
> > @@ -95,6 +121,40 @@ mp2975_read_word_helper(struct i2c_client *client, =
int page, int phase, u8 reg,
> >       return (ret > 0) ? ret & mask : ret;
> >   }
> >
> > +static int
> > +mp2971_linear2direct(struct mp2971_data *data, int page, int val)
> > +{
> > +     /* simple case */
> > +     if (val =3D=3D 0)
> > +             return 0;
> > +
> > +     /* LINEAR16 does not support negative voltages */
> > +     if (val < 0)
> > +             return 0;
> > +
> > +     /*
> > +      * For a static exponents, we don't have a choice
> > +      * but to adjust the value to it.
> > +      */
> > +
> > +     if (data->vout_exponent[page] < 0)
> > +             val <<=3D -data->vout_exponent[page];
> > +     else
> > +             val >>=3D data->vout_exponent[page];
> > +     return clamp_val(val, 0, 0xffff);
> > +}
> > +
> > +static int
> > +mp2971_vid2direct(struct mp2971_data *data, int page, int val)
> > +{
> > +     int vrf =3D data->info.vrm_version[page];
> > +
> > +     if (vrf =3D=3D imvp9)
> > +             return (val + 29) * data->vid_step[page];
> > +
> > +     return (val + 49) * data->vid_step[page];
> > +}
> > +
>
> This looks suspicious. VID -> voltage calculations should be well
> defined and be implemented in mp2975_vid2direct(). It is not entirely
> clear why a second conversion function should be needed, and why it would
> use different calculations with different results than those for
> mp2975.
>
> Example, for vrf =3D=3D imvp9, 10mV step size, and vid=3D=3D1:
>
> mp2971: (1 + 29) * 10 =3D 30 * 10 =3D 300
> mp2975: 200 + (1 - 1) * 10 =3D 200 + 0 =3D 200
>
> vid =3D 0xff =3D 255:
>
> mp2971: (255 + 29) * 10 =3D 284 * 10 =3D 2840
> mp2975: 200 + (255 - 1) * 10 =3D 200 + 254 * 10 =3D 2740
>
> Also questionable is how there could ever be an IMVP9 setting with 5mV
> step size since IMVP9 explicitly specifies a step size of 10mV.
> Also, the maximum voltage for IMVP9 is specified as 2.74V.
>
> >   static int
> >   mp2975_vid2direct(int vrf, int val)
> >   {
> > @@ -214,6 +274,74 @@ mp2975_read_phases(struct i2c_client *client, stru=
ct mp2975_data *data,
> >       return ret;
> >   }
> >
> > +static int
> > +mp2971_read_word_data(struct i2c_client *client, int page,
> > +                             int phase, int reg)
> > +{
> > +     const struct pmbus_driver_info *info =3D pmbus_get_driver_info(cl=
ient);
> > +     struct mp2971_data *data =3D to_mp2971_data(info);
> > +     int ret;
> > +
> > +     switch (reg) {
> > +     case PMBUS_OT_FAULT_LIMIT:
> > +     case PMBUS_VIN_OV_FAULT_LIMIT:
> > +     case PMBUS_VOUT_OV_FAULT_LIMIT:
> > +     case PMBUS_VOUT_UV_FAULT_LIMIT:
> > +     case PMBUS_READ_IOUT:
> > +             ret =3D mp2975_read_word_helper(client, page, phase,
> > +                                              reg, GENMASK(15, 0));
> > +             break;
> > +     case PMBUS_READ_VOUT:
> > +             ret =3D mp2975_read_word_helper(client, page, phase, reg,
> > +                                           GENMASK(11, 0));
> > +             if (ret < 0)
> > +                     return ret;
> > +             /*
> > +              * READ_VOUT can be provided in VID or direct format. The
> > +              * format type is specified by bit 15 of the register
> > +              * MP2971_MFR_DC_LOOP_CTRL. The driver enforces VOUT dire=
ct
> > +              * format, since device allows to set the different forma=
ts for
> > +              * the different rails and also all VOUT limits registers=
 are
> > +              * provided in a direct format. In case format is VID - c=
onvert
> > +              * to direct.
> > +              */
> > +             switch (data->vout_format[page]) {
> > +             case linear:
> > +                     ret =3D mp2971_linear2direct(data, page, ret);
> > +                     break;
> > +             case vid:
> > +                     ret =3D mp2971_vid2direct(data, page, ret);
> > +                     break;
> > +             case direct:
> > +                     break;
> > +             default:
> > +                     return -ENODATA;
> > +             }
> > +             break;
> > +     case PMBUS_UT_WARN_LIMIT:
> > +     case PMBUS_UT_FAULT_LIMIT:
> > +     case PMBUS_VIN_UV_WARN_LIMIT:
> > +     case PMBUS_VIN_UV_FAULT_LIMIT:
> > +     case PMBUS_VOUT_UV_WARN_LIMIT:
> > +     case PMBUS_VOUT_OV_WARN_LIMIT:
> > +     case PMBUS_VIN_OV_WARN_LIMIT:
> > +     case PMBUS_IIN_OC_FAULT_LIMIT:
> > +     case PMBUS_IOUT_OC_LV_FAULT_LIMIT:
> > +     case PMBUS_IIN_OC_WARN_LIMIT:
> > +     case PMBUS_IOUT_OC_WARN_LIMIT:
> > +     case PMBUS_IOUT_OC_FAULT_LIMIT:
> > +     case PMBUS_IOUT_UC_FAULT_LIMIT:
> > +     case PMBUS_POUT_OP_FAULT_LIMIT:
> > +     case PMBUS_POUT_OP_WARN_LIMIT:
> > +     case PMBUS_PIN_OP_WARN_LIMIT:
> > +             return -ENXIO;
> > +     default:
> > +             return -ENODATA;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
>
> Much of that code seems duplicate from mp2975_read_word_data().
> Without datasheets I can not determine if this really makes sense
> and/or is needed, or if a single function can be used for all chips.
>
> >   static int mp2975_read_word_data(struct i2c_client *client, int page,
> >                                int phase, int reg)
> >   {
> > @@ -365,6 +493,63 @@ mp2975_set_phase_rail2(struct pmbus_driver_info *i=
nfo, int num_phases)
> >               info->pfunc[MP2975_MAX_PHASE_RAIL1 - i] =3D PMBUS_HAVE_IO=
UT;
> >   }
> >
> > +static int mp2971_identify_multiphase(struct i2c_client *client,
> > +                                   struct mp2971_data *data,
> > +                                   struct pmbus_driver_info *info)
> > +{
> > +     int ret;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* Identify multiphase for rail 1 - could be from 1 to 12. */
> > +     ret =3D i2c_smbus_read_word_data(client, MP2975_MFR_VR_MULTI_CONF=
IG_R1);
> > +     if (ret <=3D 0)
> > +             return ret;
> > +
> > +     info->phases[0] =3D ret & GENMASK(3, 0);
> > +
> > +     /*
> > +      * The device provides a total of 8 PWM pins, and can be configur=
ed
> > +      * to different phase count applications for rail 1 and rail 2.
> > +      * Rail 1 can be set to 8 phases, while rail 2 can only be set to=
 4
> > +      * phases at most. When rail 1=E2=80=99s phase count is configure=
d as 0, rail
> > +      * 1 operates with 1-phase DCM. When rail 2 phase count is config=
ured
> > +      * as 0, rail 2 is disabled.
> > +      */
> > +     if (info->phases[0] > data->max_phase_rail1)
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
>
> Same here. The code is almost the same as mp2975_identify_multiphase().
> Again, without datasheets I can not determine if this really makes sense
> and/or is needed, or if a single function can be used for all chips.
>
> This is a recurring problem. It appears that the patch maximizes the
> changes against the current code instead of even trying to minimize them.
> Without datasheet, it is impossible to compare the chips to check if an
> implementation with fewer / less extensive changes would be warranted.
>
> > +
> > +static int
> > +mp2971_identify_vid(struct i2c_client *client, struct mp2971_data *dat=
a,
> > +                     struct pmbus_driver_info *info, u32 reg, int page=
,
> > +                     u32 imvp_bit, u32 vr_bit)
> > +{
> > +     int ret;
> > +
> > +     /* Identify VID mode and step selection. */
> > +     ret =3D i2c_smbus_read_word_data(client, reg);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (ret & imvp_bit) {
> > +             info->vrm_version[page] =3D imvp9;
> > +             data->vid_step[page] =3D MP2975_PROT_DEV_OV_OFF;
> > +     } else if (ret & vr_bit) {
> > +             info->vrm_version[page] =3D vr12;
> > +             data->vid_step[page] =3D MP2975_PROT_DEV_OV_ON;
> > +     } else {
> > +             info->vrm_version[page] =3D vr13;
> > +             data->vid_step[page] =3D MP2975_PROT_DEV_OV_OFF;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   static int
> >   mp2975_identify_multiphase(struct i2c_client *client, struct mp2975_d=
ata *data,
> >                          struct pmbus_driver_info *info)
> > @@ -428,6 +613,68 @@ mp2975_identify_vid(struct i2c_client *client, str=
uct mp2975_data *data,
> >       return 0;
> >   }
> >
> > +static int
> > +mp2971_identify_rails_vid(struct i2c_client *client, struct mp2971_dat=
a *data,
> > +                                  struct pmbus_driver_info *info)
> > +{
> > +     int ret;
> > +
> > +     ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* Identify VID mode for rail 1. */
> > +     ret =3D mp2971_identify_vid(client, data, info,
> > +                               MP2975_MFR_VR_MULTI_CONFIG_R1, 0,
> > +                               data->imvp9_en_r1_mask,
> > +                               MP2975_VID_STEP_SEL_R1);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* Identify VID mode for rail 2, if connected. */
> > +     if (info->phases[1])
> > +             ret =3D mp2971_identify_vid(client, data, info,
> > +                                       MP2975_MFR_VR_MULTI_CONFIG_R2, =
1,
> > +                                       data->imvp9_en_r2_mask,
> > +                                       MP2975_VID_STEP_SEL_R2);
> > +     return ret;
> > +}
> > +
> > +static int mp2971_identify_vout_format(struct i2c_client *client,
> > +                                    struct mp2971_data *data,
> > +                                    struct pmbus_driver_info *info)
> > +{
> > +     int i, ret, vout_mode;
> > +
> > +     for (i =3D 0; i < info->pages; i++) {
> > +             ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             ret =3D i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE)=
;
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             vout_mode =3D ret;
> > +
> > +             switch (vout_mode >> 5) {
> > +             case 0:
> > +                     data->vout_format[i] =3D linear;
> > +                     data->vout_exponent[i] =3D ((s8)(vout_mode << 3))=
 >> 3;
> > +                     break;
> > +             case 1:
> > +                     data->vout_format[i] =3D vid;
> > +                     break;
> > +             case 2:
> > +                     data->vout_format[i] =3D direct;
> > +                     break;
> > +             default:
> > +                     return -ENODEV;
> > +             }
> > +     }
> > +     return 0;
> > +}
> > +
> >   static int
> >   mp2975_identify_rails_vid(struct i2c_client *client, struct mp2975_da=
ta *data,
> >                         struct pmbus_driver_info *info)
> > @@ -659,6 +906,24 @@ mp2975_vout_per_rail_config_get(struct i2c_client =
*client,
> >       return 0;
> >   }
> >
> > +static struct pmbus_driver_info mp2971_info =3D {
> > +     .pages =3D 1,
> > +     .format[PSC_VOLTAGE_IN] =3D linear,
> > +     .format[PSC_VOLTAGE_OUT] =3D direct,
> > +     .format[PSC_TEMPERATURE] =3D linear,
> > +     .format[PSC_CURRENT_IN] =3D linear,
> > +     .format[PSC_CURRENT_OUT] =3D linear,
> > +     .format[PSC_POWER] =3D linear,
> > +     .m[PSC_VOLTAGE_OUT] =3D 1,
> > +     .R[PSC_VOLTAGE_OUT] =3D 3,
> > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS=
_VOUT |
> > +                PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_I=
OUT |
> > +                PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_=
POUT |
> > +                PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
> > +     .read_byte_data =3D mp2975_read_byte_data,
> > +     .read_word_data =3D mp2971_read_word_data,
> > +};
> > +
> >   static struct pmbus_driver_info mp2975_info =3D {
> >       .pages =3D 1,
> >       .format[PSC_VOLTAGE_IN] =3D linear,
> > @@ -683,63 +948,131 @@ static struct pmbus_driver_info mp2975_info =3D =
{
> >   static int mp2975_probe(struct i2c_client *client)
> >   {
> >       struct pmbus_driver_info *info;
> > -     struct mp2975_data *data;
> >       int ret;
> > +     char *name;
> >
> > -     data =3D devm_kzalloc(&client->dev, sizeof(struct mp2975_data),
> > -                         GFP_KERNEL);
> > -     if (!data)
> > -             return -ENOMEM;
> > +     name =3D (char *)i2c_match_id(mp2975_id, client)->name;
> >
> > -     memcpy(&data->info, &mp2975_info, sizeof(*info));
> > -     info =3D &data->info;
> > +     if (!name)
> > +             return -EINVAL;
> >
> > -     /* Identify multiphase configuration for rail 2. */
> > -     ret =3D mp2975_identify_multiphase_rail2(client);
> > -     if (ret < 0)
> > -             return ret;
> > +     if (!strcmp(name, "mp2971") || !strcmp(name, "mp2973")) {
> > +             struct mp2971_data *data;
> > +             struct mp2971_device_info *device_info;
> >
> > -     if (ret) {
> > -             /* Two rails are connected. */
> > -             data->info.pages =3D MP2975_PAGE_NUM;
> > -             data->info.phases[1] =3D ret;
> > -             data->info.func[1] =3D MP2975_RAIL2_FUNC;
> > -     }
> > +             data =3D devm_kzalloc(&client->dev, sizeof(struct mp2971_=
data),
> > +                                     GFP_KERNEL);
> > +             if (!data)
> > +                     return -ENOMEM;
> >
> > -     /* Identify multiphase configuration. */
> > -     ret =3D mp2975_identify_multiphase(client, data, info);
> > -     if (ret)
> > -             return ret;
> > +             device_info =3D
> > +                     (struct mp2971_device_info *)i2c_match_id(mp2975_=
id, client)
> > +                             ->driver_data;
> >
> > -     /* Identify VID setting per rail. */
> > -     ret =3D mp2975_identify_rails_vid(client, data, info);
> > -     if (ret < 0)
> > -             return ret;
> > +             memcpy(&data->info, &mp2971_info, sizeof(*info));
> > +             info =3D &data->info;
> >
> > -     /* Obtain current sense gain of power stage. */
> > -     ret =3D mp2975_current_sense_gain_get(client, data);
> > -     if (ret)
> > -             return ret;
> > +             if (device_info) {
> > +                     data->imvp9_en_r1_mask =3D device_info->imvp9_en_=
r1_mask;
> > +                     data->imvp9_en_r2_mask =3D device_info->imvp9_en_=
r2_mask;
> > +                     data->max_phase_rail1 =3D device_info->max_phase_=
rail1;
> > +                     data->max_phase_rail2 =3D device_info->max_phase_=
rail2;
> > +             }
> >
> > -     /* Obtain voltage reference values. */
> > -     ret =3D mp2975_vref_get(client, data, info);
> > -     if (ret)
> > -             return ret;
> > +             /* Identify multiphase configuration for rail 2. */
> > +             ret =3D mp2975_identify_multiphase_rail2(client);
> > +             if (ret < 0)
> > +                     return ret;
> >
> > -     /* Obtain vout over-voltage scales. */
> > -     ret =3D mp2975_vout_ov_scale_get(client, data, info);
> > -     if (ret < 0)
> > -             return ret;
> > +             if (ret) {
> > +                     /* Two rails are connected. */
> > +                     data->info.pages =3D MP2975_PAGE_NUM;
> > +                     data->info.phases[1] =3D ret;
> > +                     data->info.func[1] =3D MP2971_RAIL2_FUNC;
> > +             }
> >
> > -     /* Obtain offsets, maximum and format for vout. */
> > -     ret =3D mp2975_vout_per_rail_config_get(client, data, info);
> > -     if (ret)
> > -             return ret;
> > +             /* Identify multiphase configuration. */
> > +             ret =3D mp2971_identify_multiphase(client, data, info);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* Identify VID setting per rail. */
> > +             ret =3D mp2971_identify_rails_vid(client, data, info);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             /* Identify vout format. */
> > +             ret =3D mp2971_identify_vout_format(client, data, info);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +     } else {
> > +             struct mp2975_data *data;
> > +
> > +             data =3D devm_kzalloc(&client->dev, sizeof(struct mp2975_=
data),
> > +                                     GFP_KERNEL);
> > +             if (!data)
> > +                     return -ENOMEM;
> > +
> > +             memcpy(&data->info, &mp2975_info, sizeof(*info));
> > +             info =3D &data->info;
> > +
> > +             /* Identify multiphase configuration for rail 2. */
> > +             ret =3D mp2975_identify_multiphase_rail2(client);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             if (ret) {
> > +                     /* Two rails are connected. */
> > +                     data->info.pages =3D MP2975_PAGE_NUM;
> > +                     data->info.phases[1] =3D ret;
> > +                     data->info.func[1] =3D MP2975_RAIL2_FUNC;
> > +             }
> > +
> > +             /* Identify multiphase configuration. */
> > +             ret =3D mp2975_identify_multiphase(client, data, info);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* Identify VID setting per rail. */
> > +             ret =3D mp2975_identify_rails_vid(client, data, info);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             /* Obtain current sense gain of power stage. */
> > +             ret =3D mp2975_current_sense_gain_get(client, data);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* Obtain voltage reference values. */
> > +             ret =3D mp2975_vref_get(client, data, info);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* Obtain vout over-voltage scales. */
> > +             ret =3D mp2975_vout_ov_scale_get(client, data, info);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             /* Obtain offsets, maximum and format for vout. */
> > +             ret =3D mp2975_vout_per_rail_config_get(client, data, inf=
o);
> > +             if (ret)
> > +                     return ret;
> > +     }
> >
> >       return pmbus_do_probe(client, info);
> >   }
> >
> > +static const struct mp2971_device_info mp2971_device_info =3D {
> > +     .imvp9_en_r1_mask =3D BIT(14),
> > +     .imvp9_en_r2_mask =3D BIT(13),
> > +     .max_phase_rail1 =3D 8,
> > +     .max_phase_rail2 =3D 4,
> > +};
> > +
> >   static const struct i2c_device_id mp2975_id[] =3D {
> > +     {"mp2971", (kernel_ulong_t)&mp2971_device_info },
> > +     {"mp2973", (kernel_ulong_t)&mp2971_device_info },
> >       {"mp2975", 0},
> >       {}
> >   };
>
