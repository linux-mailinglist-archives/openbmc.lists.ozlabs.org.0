Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5B67134D
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 06:49:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxZZK6vBZz3fDJ
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 16:48:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=GhAv74MQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=wangxiaohua.1217@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=GhAv74MQ;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxZVH07Qhz3cBh
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 16:45:26 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id f3so23715744pgc.2
        for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2023 21:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hLMiNISp5QSKsxuqWhhJ5FgiLeNZKAEBw1KTz9nE2Y4=;
        b=GhAv74MQbo/0Pcja/VQSN9AWJDizQipblt+iYfQTO+gooib8mwApTncGfQg49xoZba
         ev03h5qHqHE5EXBLRqof5xGVhWtErFJaT9E9TkvihaHwGj2jtslqm8Pbc5e39hp7lPN9
         VxYzXTU71jT1GDhgKPbKQqlZBLHOclu0gyjArGJR2igbSIYDE6tkgT7nCMJTInn3P0bp
         leTLBMFhTzx3nd9Z3/IXvnVMPndVjRxeGR9XnKfI0UEvHSejV4Q0gk9x8g7Bul2ZGu9j
         dYoCs8/w2GOYwWFcPotEa/ZflvEcMDFuOLUo+vgiNu0vYkA9iM6BcbqM2ElyuvgKKKoh
         Hu+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLMiNISp5QSKsxuqWhhJ5FgiLeNZKAEBw1KTz9nE2Y4=;
        b=Is4BHgDg7RfkqEODAOf9clBuM0giKG/1L/4HwxKQHxaMOe7Gjo1mHoyAwfN94+usON
         YQ7tG2gBsI2PKH+Ryq1Ekeq9Q1JN5cLWe9Ezukhynz8reMiK483gPRgGd+RDsp9rV2n1
         PiN7ACRQ7DV/UpnP2gMpHK/uJy3xgov8zIHy6TSZ0MfFFk9Q0ZfQRXiRzuddW52iAX0N
         T3xmBNA3yuTFoTbDKtr/X+rZmSlwVRab5+JWOkUpMm/LJ2x7faM8APjD47A3Dn1sjAY7
         wQYWq9QDRjW2t3JCkA9iOI2vAtbc9J4YSAx0cUcEjNlsRNaANxjc1YlAsmtUtE8oMN2W
         ZgXg==
X-Gm-Message-State: AFqh2kp1J16wOVQ3XkCDYFsVxuI2DDmKgrctCoAvoUGZlN4sF+o5EzYE
	uBQZWv3T5CTuyQubnWlFeuz9XCaTjWZGFfwridv4zZ09XnkNCl3M
X-Google-Smtp-Source: AMrXdXsFvdL6socjWVeBqD5lZGtDfoYMiKyt3HcexC+d5Z2yRQfMie3OvjwYPQ6u3z5v3bl9zoCYhiL7a7rjoL8LEeo=
X-Received: by 2002:a05:6a00:2169:b0:58d:9710:9302 with SMTP id
 r9-20020a056a00216900b0058d97109302mr552448pff.58.1674020723566; Tue, 17 Jan
 2023 21:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20221209024522.2102509-1-wangxiaohua.1217@bytedance.com>
 <c319b24e-a2bf-9516-5ae3-1b7da73862f7@roeck-us.net> <CACPK8Xekz5LPqMH4_2cT2gg3NtoPt0rjM6ZY=8XccytMoaN=Bw@mail.gmail.com>
In-Reply-To: <CACPK8Xekz5LPqMH4_2cT2gg3NtoPt0rjM6ZY=8XccytMoaN=Bw@mail.gmail.com>
From: =?UTF-8?B?5pmT5Y2O546L?= <wangxiaohua.1217@bytedance.com>
Date: Wed, 18 Jan 2023 13:45:11 +0800
Message-ID: <CAEJrW_jkYSGOUffzQuaYotd8kMbr-k0+cih3Rfzw1EyWeBo1Kw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH linux dev-6.0 v3] pmbus: Add mp2971/mp2973
 support in mp2975
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="00000000000093848105f283526a"
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, jdelvare@suse.com, linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000093848105f283526a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Joel,

Thanks, I will optimize the code following Guenter's comments first.

Cheers,

Xiaohua


On Wed, Jan 18, 2023 at 11:56 AM Joel Stanley <joel@jms.id.au> wrote:

> Hello Xiaohua,
>
>
> On Sat, 10 Dec 2022 at 17:54, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 12/8/22 18:45, Wang Xiaohua wrote:
> > > Add mp2971/mp2973 support in mp2975
>
> Guenter has some comments for you to address. Are you planning on
> working on this further?
>
> I would like to help you get support for this device in the tree, but
> it will require some more work.
>
> Cheers,
>
> Joel
>
> > >
> > > Tested with:
> > > My unit only include mp2971 and mp2973 devices
> > > MP2973:
> > > cat /sys/bus/i2c/devices/5-0076/hwmon/hwmon24/*label
> > > iin
> > > iout1
> > > iout2
> > > vin
> > > vout1
> > > vout2
> > > pin
> > > pout1
> > > pout2
> > > cat /sys/bus/i2c/devices/5-0076/hwmon/hwmon24/*input
> > > 0
> > > 82500
> > > 14000
> > > 12187
> > > 1787
> > > 1793
> > > 0
> > > 148000000
> > > 25000000
> > > 54000
> > > MP2971:
> > > cat /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*label
> > > iin
> > > iout1
> > > iout2
> > > vin
> > > vout1
> > > vout2
> > > pin
> > > pout1
> > > pout2
> > > cat /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*input
> > > 18500
> > > 22000
> > > 500
> > > 12187
> > > 1025
> > > 1800
> > > 226000000
> > > 22000000
> > > 1000000
> > > 55000
> > >
> >
> > Test results are not very useful. Better use something like
> > "grep . /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*".
> >
> > Either case, test results should be provided after "---" and not be par=
t
> > of the commit description. Instead, the commit description should expla=
in
> > what those chips actually are.
> >
> >
> > > Signed-off-by: Wang Xiaohua <wangxiaohua.1217@bytedance.com>
> > >
> > > v2:
> > > - Fix auto build test WARNING
> > >
> > > v3:
> > > - Fix incorrect return code
> > > ---
> > >   drivers/hwmon/pmbus/mp2975.c | 415
> +++++++++++++++++++++++++++++++----
> > >   1 file changed, 374 insertions(+), 41 deletions(-)
> > >
> >
> > Update to Documentation/hwmon/mp2975.rst and
> > Documentation/devicetree/bindings/trivial-devices.yaml required.
> >
> > However, there is a more severe problem: The changes are too complex
> > for me to review, and the chip datasheets are not published. I can not
> evaluate
> > if the changes are really needed, if there is a less complex solution,
> > or if they even make sense. Someone with access to a datasheet will hav=
e
> > to step up as maintainer for this driver.
> >
> > Additional comments inline.
> >
> > Guenter
> >
> > > diff --git a/drivers/hwmon/pmbus/mp2975.c
> b/drivers/hwmon/pmbus/mp2975.c
> > > index 51986adfbf47..4d1b7ac1800e 100644
> > > --- a/drivers/hwmon/pmbus/mp2975.c
> > > +++ b/drivers/hwmon/pmbus/mp2975.c
> > > @@ -52,10 +52,33 @@
> > >   #define MP2975_MAX_PHASE_RAIL2      4
> > >   #define MP2975_PAGE_NUM             2
> > >
> > > +#define MP2971_RAIL2_FUNC
>           \
> > > +     (PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |
>       \
> > > +      PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT)
> > > +
> > >   #define MP2975_RAIL2_FUNC   (PMBUS_HAVE_VOUT |
> PMBUS_HAVE_STATUS_VOUT | \
> > >                                PMBUS_HAVE_IOUT |
> PMBUS_HAVE_STATUS_IOUT | \
> > >                                PMBUS_HAVE_POUT | PMBUS_PHASE_VIRTUAL)
> > >
> > > +struct mp2971_device_info {
> > > +     int max_phase_rail1;
> > > +     int max_phase_rail2;
> > > +     int imvp9_en_r1_mask;
> > > +     int imvp9_en_r2_mask;
> > > +};
> > > +
> > > +struct mp2971_data {
> > > +     struct pmbus_driver_info info;
> > > +     int vid_step[MP2975_PAGE_NUM];
> > > +     int vout_format[MP2975_PAGE_NUM];
> > > +     int vout_mode[MP2975_PAGE_NUM];
> > > +     int vout_exponent[MP2975_PAGE_NUM];
> > > +     int max_phase_rail1;
> > > +     int max_phase_rail2;
> > > +     int imvp9_en_r1_mask;
> > > +     int imvp9_en_r2_mask;
> > > +};
> > > +
> > >   struct mp2975_data {
> > >       struct pmbus_driver_info info;
> > >       int vout_scale;
> > > @@ -68,6 +91,9 @@ struct mp2975_data {
> > >       int curr_sense_gain[MP2975_PAGE_NUM];
> > >   };
> > >
> > > +static const struct i2c_device_id mp2975_id[];
> > > +
> > > +#define to_mp2971_data(x) container_of(x, struct mp2971_data, info)
> > >   #define to_mp2975_data(x)  container_of(x, struct mp2975_data, info=
)
> > >
> > >   static int mp2975_read_byte_data(struct i2c_client *client, int
> page, int reg)
> > > @@ -95,6 +121,40 @@ mp2975_read_word_helper(struct i2c_client *client=
,
> int page, int phase, u8 reg,
> > >       return (ret > 0) ? ret & mask : ret;
> > >   }
> > >
> > > +static int
> > > +mp2971_linear2direct(struct mp2971_data *data, int page, int val)
> > > +{
> > > +     /* simple case */
> > > +     if (val =3D=3D 0)
> > > +             return 0;
> > > +
> > > +     /* LINEAR16 does not support negative voltages */
> > > +     if (val < 0)
> > > +             return 0;
> > > +
> > > +     /*
> > > +      * For a static exponents, we don't have a choice
> > > +      * but to adjust the value to it.
> > > +      */
> > > +
> > > +     if (data->vout_exponent[page] < 0)
> > > +             val <<=3D -data->vout_exponent[page];
> > > +     else
> > > +             val >>=3D data->vout_exponent[page];
> > > +     return clamp_val(val, 0, 0xffff);
> > > +}
> > > +
> > > +static int
> > > +mp2971_vid2direct(struct mp2971_data *data, int page, int val)
> > > +{
> > > +     int vrf =3D data->info.vrm_version[page];
> > > +
> > > +     if (vrf =3D=3D imvp9)
> > > +             return (val + 29) * data->vid_step[page];
> > > +
> > > +     return (val + 49) * data->vid_step[page];
> > > +}
> > > +
> >
> > This looks suspicious. VID -> voltage calculations should be well
> > defined and be implemented in mp2975_vid2direct(). It is not entirely
> > clear why a second conversion function should be needed, and why it wou=
ld
> > use different calculations with different results than those for
> > mp2975.
> >
> > Example, for vrf =3D=3D imvp9, 10mV step size, and vid=3D=3D1:
> >
> > mp2971: (1 + 29) * 10 =3D 30 * 10 =3D 300
> > mp2975: 200 + (1 - 1) * 10 =3D 200 + 0 =3D 200
> >
> > vid =3D 0xff =3D 255:
> >
> > mp2971: (255 + 29) * 10 =3D 284 * 10 =3D 2840
> > mp2975: 200 + (255 - 1) * 10 =3D 200 + 254 * 10 =3D 2740
> >
> > Also questionable is how there could ever be an IMVP9 setting with 5mV
> > step size since IMVP9 explicitly specifies a step size of 10mV.
> > Also, the maximum voltage for IMVP9 is specified as 2.74V.
> >
> > >   static int
> > >   mp2975_vid2direct(int vrf, int val)
> > >   {
> > > @@ -214,6 +274,74 @@ mp2975_read_phases(struct i2c_client *client,
> struct mp2975_data *data,
> > >       return ret;
> > >   }
> > >
> > > +static int
> > > +mp2971_read_word_data(struct i2c_client *client, int page,
> > > +                             int phase, int reg)
> > > +{
> > > +     const struct pmbus_driver_info *info =3D
> pmbus_get_driver_info(client);
> > > +     struct mp2971_data *data =3D to_mp2971_data(info);
> > > +     int ret;
> > > +
> > > +     switch (reg) {
> > > +     case PMBUS_OT_FAULT_LIMIT:
> > > +     case PMBUS_VIN_OV_FAULT_LIMIT:
> > > +     case PMBUS_VOUT_OV_FAULT_LIMIT:
> > > +     case PMBUS_VOUT_UV_FAULT_LIMIT:
> > > +     case PMBUS_READ_IOUT:
> > > +             ret =3D mp2975_read_word_helper(client, page, phase,
> > > +                                              reg, GENMASK(15, 0));
> > > +             break;
> > > +     case PMBUS_READ_VOUT:
> > > +             ret =3D mp2975_read_word_helper(client, page, phase, re=
g,
> > > +                                           GENMASK(11, 0));
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +             /*
> > > +              * READ_VOUT can be provided in VID or direct format. T=
he
> > > +              * format type is specified by bit 15 of the register
> > > +              * MP2971_MFR_DC_LOOP_CTRL. The driver enforces VOUT
> direct
> > > +              * format, since device allows to set the different
> formats for
> > > +              * the different rails and also all VOUT limits
> registers are
> > > +              * provided in a direct format. In case format is VID -
> convert
> > > +              * to direct.
> > > +              */
> > > +             switch (data->vout_format[page]) {
> > > +             case linear:
> > > +                     ret =3D mp2971_linear2direct(data, page, ret);
> > > +                     break;
> > > +             case vid:
> > > +                     ret =3D mp2971_vid2direct(data, page, ret);
> > > +                     break;
> > > +             case direct:
> > > +                     break;
> > > +             default:
> > > +                     return -ENODATA;
> > > +             }
> > > +             break;
> > > +     case PMBUS_UT_WARN_LIMIT:
> > > +     case PMBUS_UT_FAULT_LIMIT:
> > > +     case PMBUS_VIN_UV_WARN_LIMIT:
> > > +     case PMBUS_VIN_UV_FAULT_LIMIT:
> > > +     case PMBUS_VOUT_UV_WARN_LIMIT:
> > > +     case PMBUS_VOUT_OV_WARN_LIMIT:
> > > +     case PMBUS_VIN_OV_WARN_LIMIT:
> > > +     case PMBUS_IIN_OC_FAULT_LIMIT:
> > > +     case PMBUS_IOUT_OC_LV_FAULT_LIMIT:
> > > +     case PMBUS_IIN_OC_WARN_LIMIT:
> > > +     case PMBUS_IOUT_OC_WARN_LIMIT:
> > > +     case PMBUS_IOUT_OC_FAULT_LIMIT:
> > > +     case PMBUS_IOUT_UC_FAULT_LIMIT:
> > > +     case PMBUS_POUT_OP_FAULT_LIMIT:
> > > +     case PMBUS_POUT_OP_WARN_LIMIT:
> > > +     case PMBUS_PIN_OP_WARN_LIMIT:
> > > +             return -ENXIO;
> > > +     default:
> > > +             return -ENODATA;
> > > +     }
> > > +
> > > +     return ret;
> > > +}
> > > +
> >
> > Much of that code seems duplicate from mp2975_read_word_data().
> > Without datasheets I can not determine if this really makes sense
> > and/or is needed, or if a single function can be used for all chips.
> >
> > >   static int mp2975_read_word_data(struct i2c_client *client, int pag=
e,
> > >                                int phase, int reg)
> > >   {
> > > @@ -365,6 +493,63 @@ mp2975_set_phase_rail2(struct pmbus_driver_info
> *info, int num_phases)
> > >               info->pfunc[MP2975_MAX_PHASE_RAIL1 - i] =3D
> PMBUS_HAVE_IOUT;
> > >   }
> > >
> > > +static int mp2971_identify_multiphase(struct i2c_client *client,
> > > +                                   struct mp2971_data *data,
> > > +                                   struct pmbus_driver_info *info)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     /* Identify multiphase for rail 1 - could be from 1 to 12. */
> > > +     ret =3D i2c_smbus_read_word_data(client,
> MP2975_MFR_VR_MULTI_CONFIG_R1);
> > > +     if (ret <=3D 0)
> > > +             return ret;
> > > +
> > > +     info->phases[0] =3D ret & GENMASK(3, 0);
> > > +
> > > +     /*
> > > +      * The device provides a total of 8 PWM pins, and can be
> configured
> > > +      * to different phase count applications for rail 1 and rail 2.
> > > +      * Rail 1 can be set to 8 phases, while rail 2 can only be set
> to 4
> > > +      * phases at most. When rail 1=E2=80=99s phase count is configu=
red as 0,
> rail
> > > +      * 1 operates with 1-phase DCM. When rail 2 phase count is
> configured
> > > +      * as 0, rail 2 is disabled.
> > > +      */
> > > +     if (info->phases[0] > data->max_phase_rail1)
> > > +             return -EINVAL;
> > > +
> > > +     return 0;
> > > +}
> >
> > Same here. The code is almost the same as mp2975_identify_multiphase().
> > Again, without datasheets I can not determine if this really makes sens=
e
> > and/or is needed, or if a single function can be used for all chips.
> >
> > This is a recurring problem. It appears that the patch maximizes the
> > changes against the current code instead of even trying to minimize the=
m.
> > Without datasheet, it is impossible to compare the chips to check if an
> > implementation with fewer / less extensive changes would be warranted.
> >
> > > +
> > > +static int
> > > +mp2971_identify_vid(struct i2c_client *client, struct mp2971_data
> *data,
> > > +                     struct pmbus_driver_info *info, u32 reg, int
> page,
> > > +                     u32 imvp_bit, u32 vr_bit)
> > > +{
> > > +     int ret;
> > > +
> > > +     /* Identify VID mode and step selection. */
> > > +     ret =3D i2c_smbus_read_word_data(client, reg);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     if (ret & imvp_bit) {
> > > +             info->vrm_version[page] =3D imvp9;
> > > +             data->vid_step[page] =3D MP2975_PROT_DEV_OV_OFF;
> > > +     } else if (ret & vr_bit) {
> > > +             info->vrm_version[page] =3D vr12;
> > > +             data->vid_step[page] =3D MP2975_PROT_DEV_OV_ON;
> > > +     } else {
> > > +             info->vrm_version[page] =3D vr13;
> > > +             data->vid_step[page] =3D MP2975_PROT_DEV_OV_OFF;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >   static int
> > >   mp2975_identify_multiphase(struct i2c_client *client, struct
> mp2975_data *data,
> > >                          struct pmbus_driver_info *info)
> > > @@ -428,6 +613,68 @@ mp2975_identify_vid(struct i2c_client *client,
> struct mp2975_data *data,
> > >       return 0;
> > >   }
> > >
> > > +static int
> > > +mp2971_identify_rails_vid(struct i2c_client *client, struct
> mp2971_data *data,
> > > +                                  struct pmbus_driver_info *info)
> > > +{
> > > +     int ret;
> > > +
> > > +     ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     /* Identify VID mode for rail 1. */
> > > +     ret =3D mp2971_identify_vid(client, data, info,
> > > +                               MP2975_MFR_VR_MULTI_CONFIG_R1, 0,
> > > +                               data->imvp9_en_r1_mask,
> > > +                               MP2975_VID_STEP_SEL_R1);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     /* Identify VID mode for rail 2, if connected. */
> > > +     if (info->phases[1])
> > > +             ret =3D mp2971_identify_vid(client, data, info,
> > > +                                       MP2975_MFR_VR_MULTI_CONFIG_R2=
,
> 1,
> > > +                                       data->imvp9_en_r2_mask,
> > > +                                       MP2975_VID_STEP_SEL_R2);
> > > +     return ret;
> > > +}
> > > +
> > > +static int mp2971_identify_vout_format(struct i2c_client *client,
> > > +                                    struct mp2971_data *data,
> > > +                                    struct pmbus_driver_info *info)
> > > +{
> > > +     int i, ret, vout_mode;
> > > +
> > > +     for (i =3D 0; i < info->pages; i++) {
> > > +             ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, i=
);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             ret =3D i2c_smbus_read_byte_data(client, PMBUS_VOUT_MOD=
E);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             vout_mode =3D ret;
> > > +
> > > +             switch (vout_mode >> 5) {
> > > +             case 0:
> > > +                     data->vout_format[i] =3D linear;
> > > +                     data->vout_exponent[i] =3D ((s8)(vout_mode << 3=
))
> >> 3;
> > > +                     break;
> > > +             case 1:
> > > +                     data->vout_format[i] =3D vid;
> > > +                     break;
> > > +             case 2:
> > > +                     data->vout_format[i] =3D direct;
> > > +                     break;
> > > +             default:
> > > +                     return -ENODEV;
> > > +             }
> > > +     }
> > > +     return 0;
> > > +}
> > > +
> > >   static int
> > >   mp2975_identify_rails_vid(struct i2c_client *client, struct
> mp2975_data *data,
> > >                         struct pmbus_driver_info *info)
> > > @@ -659,6 +906,24 @@ mp2975_vout_per_rail_config_get(struct i2c_clien=
t
> *client,
> > >       return 0;
> > >   }
> > >
> > > +static struct pmbus_driver_info mp2971_info =3D {
> > > +     .pages =3D 1,
> > > +     .format[PSC_VOLTAGE_IN] =3D linear,
> > > +     .format[PSC_VOLTAGE_OUT] =3D direct,
> > > +     .format[PSC_TEMPERATURE] =3D linear,
> > > +     .format[PSC_CURRENT_IN] =3D linear,
> > > +     .format[PSC_CURRENT_OUT] =3D linear,
> > > +     .format[PSC_POWER] =3D linear,
> > > +     .m[PSC_VOLTAGE_OUT] =3D 1,
> > > +     .R[PSC_VOLTAGE_OUT] =3D 3,
> > > +     .func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT |
> PMBUS_HAVE_STATUS_VOUT |
> > > +                PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT |
> PMBUS_HAVE_STATUS_IOUT |
> > > +                PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> PMBUS_HAVE_POUT |
> > > +                PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
> > > +     .read_byte_data =3D mp2975_read_byte_data,
> > > +     .read_word_data =3D mp2971_read_word_data,
> > > +};
> > > +
> > >   static struct pmbus_driver_info mp2975_info =3D {
> > >       .pages =3D 1,
> > >       .format[PSC_VOLTAGE_IN] =3D linear,
> > > @@ -683,63 +948,131 @@ static struct pmbus_driver_info mp2975_info =
=3D {
> > >   static int mp2975_probe(struct i2c_client *client)
> > >   {
> > >       struct pmbus_driver_info *info;
> > > -     struct mp2975_data *data;
> > >       int ret;
> > > +     char *name;
> > >
> > > -     data =3D devm_kzalloc(&client->dev, sizeof(struct mp2975_data),
> > > -                         GFP_KERNEL);
> > > -     if (!data)
> > > -             return -ENOMEM;
> > > +     name =3D (char *)i2c_match_id(mp2975_id, client)->name;
> > >
> > > -     memcpy(&data->info, &mp2975_info, sizeof(*info));
> > > -     info =3D &data->info;
> > > +     if (!name)
> > > +             return -EINVAL;
> > >
> > > -     /* Identify multiphase configuration for rail 2. */
> > > -     ret =3D mp2975_identify_multiphase_rail2(client);
> > > -     if (ret < 0)
> > > -             return ret;
> > > +     if (!strcmp(name, "mp2971") || !strcmp(name, "mp2973")) {
> > > +             struct mp2971_data *data;
> > > +             struct mp2971_device_info *device_info;
> > >
> > > -     if (ret) {
> > > -             /* Two rails are connected. */
> > > -             data->info.pages =3D MP2975_PAGE_NUM;
> > > -             data->info.phases[1] =3D ret;
> > > -             data->info.func[1] =3D MP2975_RAIL2_FUNC;
> > > -     }
> > > +             data =3D devm_kzalloc(&client->dev, sizeof(struct
> mp2971_data),
> > > +                                     GFP_KERNEL);
> > > +             if (!data)
> > > +                     return -ENOMEM;
> > >
> > > -     /* Identify multiphase configuration. */
> > > -     ret =3D mp2975_identify_multiphase(client, data, info);
> > > -     if (ret)
> > > -             return ret;
> > > +             device_info =3D
> > > +                     (struct mp2971_device_info
> *)i2c_match_id(mp2975_id, client)
> > > +                             ->driver_data;
> > >
> > > -     /* Identify VID setting per rail. */
> > > -     ret =3D mp2975_identify_rails_vid(client, data, info);
> > > -     if (ret < 0)
> > > -             return ret;
> > > +             memcpy(&data->info, &mp2971_info, sizeof(*info));
> > > +             info =3D &data->info;
> > >
> > > -     /* Obtain current sense gain of power stage. */
> > > -     ret =3D mp2975_current_sense_gain_get(client, data);
> > > -     if (ret)
> > > -             return ret;
> > > +             if (device_info) {
> > > +                     data->imvp9_en_r1_mask =3D
> device_info->imvp9_en_r1_mask;
> > > +                     data->imvp9_en_r2_mask =3D
> device_info->imvp9_en_r2_mask;
> > > +                     data->max_phase_rail1 =3D
> device_info->max_phase_rail1;
> > > +                     data->max_phase_rail2 =3D
> device_info->max_phase_rail2;
> > > +             }
> > >
> > > -     /* Obtain voltage reference values. */
> > > -     ret =3D mp2975_vref_get(client, data, info);
> > > -     if (ret)
> > > -             return ret;
> > > +             /* Identify multiphase configuration for rail 2. */
> > > +             ret =3D mp2975_identify_multiphase_rail2(client);
> > > +             if (ret < 0)
> > > +                     return ret;
> > >
> > > -     /* Obtain vout over-voltage scales. */
> > > -     ret =3D mp2975_vout_ov_scale_get(client, data, info);
> > > -     if (ret < 0)
> > > -             return ret;
> > > +             if (ret) {
> > > +                     /* Two rails are connected. */
> > > +                     data->info.pages =3D MP2975_PAGE_NUM;
> > > +                     data->info.phases[1] =3D ret;
> > > +                     data->info.func[1] =3D MP2971_RAIL2_FUNC;
> > > +             }
> > >
> > > -     /* Obtain offsets, maximum and format for vout. */
> > > -     ret =3D mp2975_vout_per_rail_config_get(client, data, info);
> > > -     if (ret)
> > > -             return ret;
> > > +             /* Identify multiphase configuration. */
> > > +             ret =3D mp2971_identify_multiphase(client, data, info);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             /* Identify VID setting per rail. */
> > > +             ret =3D mp2971_identify_rails_vid(client, data, info);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             /* Identify vout format. */
> > > +             ret =3D mp2971_identify_vout_format(client, data, info)=
;
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +     } else {
> > > +             struct mp2975_data *data;
> > > +
> > > +             data =3D devm_kzalloc(&client->dev, sizeof(struct
> mp2975_data),
> > > +                                     GFP_KERNEL);
> > > +             if (!data)
> > > +                     return -ENOMEM;
> > > +
> > > +             memcpy(&data->info, &mp2975_info, sizeof(*info));
> > > +             info =3D &data->info;
> > > +
> > > +             /* Identify multiphase configuration for rail 2. */
> > > +             ret =3D mp2975_identify_multiphase_rail2(client);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             if (ret) {
> > > +                     /* Two rails are connected. */
> > > +                     data->info.pages =3D MP2975_PAGE_NUM;
> > > +                     data->info.phases[1] =3D ret;
> > > +                     data->info.func[1] =3D MP2975_RAIL2_FUNC;
> > > +             }
> > > +
> > > +             /* Identify multiphase configuration. */
> > > +             ret =3D mp2975_identify_multiphase(client, data, info);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             /* Identify VID setting per rail. */
> > > +             ret =3D mp2975_identify_rails_vid(client, data, info);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             /* Obtain current sense gain of power stage. */
> > > +             ret =3D mp2975_current_sense_gain_get(client, data);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             /* Obtain voltage reference values. */
> > > +             ret =3D mp2975_vref_get(client, data, info);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             /* Obtain vout over-voltage scales. */
> > > +             ret =3D mp2975_vout_ov_scale_get(client, data, info);
> > > +             if (ret < 0)
> > > +                     return ret;
> > > +
> > > +             /* Obtain offsets, maximum and format for vout. */
> > > +             ret =3D mp2975_vout_per_rail_config_get(client, data,
> info);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > >
> > >       return pmbus_do_probe(client, info);
> > >   }
> > >
> > > +static const struct mp2971_device_info mp2971_device_info =3D {
> > > +     .imvp9_en_r1_mask =3D BIT(14),
> > > +     .imvp9_en_r2_mask =3D BIT(13),
> > > +     .max_phase_rail1 =3D 8,
> > > +     .max_phase_rail2 =3D 4,
> > > +};
> > > +
> > >   static const struct i2c_device_id mp2975_id[] =3D {
> > > +     {"mp2971", (kernel_ulong_t)&mp2971_device_info },
> > > +     {"mp2973", (kernel_ulong_t)&mp2971_device_info },
> > >       {"mp2975", 0},
> > >       {}
> > >   };
> >
>

--00000000000093848105f283526a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Joel,</div><div><br></div><div>Thanks, I will o=
ptimize the code following=C2=A0<span style=3D"font-size:14px">Guenter&#39;=
s comments first.</span></div><div><span style=3D"font-size:14px"><br></spa=
n></div><div><span style=3D"font-size:14px">Cheers,</span></div><div><span =
style=3D"font-size:14px"><br></span></div><div><span style=3D"font-size:14p=
x">Xiaohua</span></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jan 18, 2023 at 11:56 AM Joel Stanley &lt;<a h=
ref=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hello Xiaohua,<br>
<br>
<br>
On Sat, 10 Dec 2022 at 17:54, Guenter Roeck &lt;<a href=3D"mailto:linux@roe=
ck-us.net" target=3D"_blank">linux@roeck-us.net</a>&gt; wrote:<br>
&gt;<br>
&gt; On 12/8/22 18:45, Wang Xiaohua wrote:<br>
&gt; &gt; Add mp2971/mp2973 support in mp2975<br>
<br>
Guenter has some comments for you to address. Are you planning on<br>
working on this further?<br>
<br>
I would like to help you get support for this device in the tree, but<br>
it will require some more work.<br>
<br>
Cheers,<br>
<br>
Joel<br>
<br>
&gt; &gt;<br>
&gt; &gt; Tested with:<br>
&gt; &gt; My unit only include mp2971 and mp2973 devices<br>
&gt; &gt; MP2973:<br>
&gt; &gt; cat /sys/bus/i2c/devices/5-0076/hwmon/hwmon24/*label<br>
&gt; &gt; iin<br>
&gt; &gt; iout1<br>
&gt; &gt; iout2<br>
&gt; &gt; vin<br>
&gt; &gt; vout1<br>
&gt; &gt; vout2<br>
&gt; &gt; pin<br>
&gt; &gt; pout1<br>
&gt; &gt; pout2<br>
&gt; &gt; cat /sys/bus/i2c/devices/5-0076/hwmon/hwmon24/*input<br>
&gt; &gt; 0<br>
&gt; &gt; 82500<br>
&gt; &gt; 14000<br>
&gt; &gt; 12187<br>
&gt; &gt; 1787<br>
&gt; &gt; 1793<br>
&gt; &gt; 0<br>
&gt; &gt; 148000000<br>
&gt; &gt; 25000000<br>
&gt; &gt; 54000<br>
&gt; &gt; MP2971:<br>
&gt; &gt; cat /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*label<br>
&gt; &gt; iin<br>
&gt; &gt; iout1<br>
&gt; &gt; iout2<br>
&gt; &gt; vin<br>
&gt; &gt; vout1<br>
&gt; &gt; vout2<br>
&gt; &gt; pin<br>
&gt; &gt; pout1<br>
&gt; &gt; pout2<br>
&gt; &gt; cat /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*input<br>
&gt; &gt; 18500<br>
&gt; &gt; 22000<br>
&gt; &gt; 500<br>
&gt; &gt; 12187<br>
&gt; &gt; 1025<br>
&gt; &gt; 1800<br>
&gt; &gt; 226000000<br>
&gt; &gt; 22000000<br>
&gt; &gt; 1000000<br>
&gt; &gt; 55000<br>
&gt; &gt;<br>
&gt;<br>
&gt; Test results are not very useful. Better use something like<br>
&gt; &quot;grep . /sys/bus/i2c/devices/5-0062/hwmon/hwmon20/*&quot;.<br>
&gt;<br>
&gt; Either case, test results should be provided after &quot;---&quot; and=
 not be part<br>
&gt; of the commit description. Instead, the commit description should expl=
ain<br>
&gt; what those chips actually are.<br>
&gt;<br>
&gt;<br>
&gt; &gt; Signed-off-by: Wang Xiaohua &lt;<a href=3D"mailto:wangxiaohua.121=
7@bytedance.com" target=3D"_blank">wangxiaohua.1217@bytedance.com</a>&gt;<b=
r>
&gt; &gt;<br>
&gt; &gt; v2:<br>
&gt; &gt; - Fix auto build test WARNING<br>
&gt; &gt;<br>
&gt; &gt; v3:<br>
&gt; &gt; - Fix incorrect return code<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0drivers/hwmon/pmbus/mp2975.c | 415 ++++++++++++++++++=
+++++++++++++----<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 374 insertions(+), 41 deletions(-)<br=
>
&gt; &gt;<br>
&gt;<br>
&gt; Update to Documentation/hwmon/mp2975.rst and<br>
&gt; Documentation/devicetree/bindings/trivial-devices.yaml required.<br>
&gt;<br>
&gt; However, there is a more severe problem: The changes are too complex<b=
r>
&gt; for me to review, and the chip datasheets are not published. I can not=
 evaluate<br>
&gt; if the changes are really needed, if there is a less complex solution,=
<br>
&gt; or if they even make sense. Someone with access to a datasheet will ha=
ve<br>
&gt; to step up as maintainer for this driver.<br>
&gt;<br>
&gt; Additional comments inline.<br>
&gt;<br>
&gt; Guenter<br>
&gt;<br>
&gt; &gt; diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/m=
p2975.c<br>
&gt; &gt; index 51986adfbf47..4d1b7ac1800e 100644<br>
&gt; &gt; --- a/drivers/hwmon/pmbus/mp2975.c<br>
&gt; &gt; +++ b/drivers/hwmon/pmbus/mp2975.c<br>
&gt; &gt; @@ -52,10 +52,33 @@<br>
&gt; &gt;=C2=A0 =C2=A0#define MP2975_MAX_PHASE_RAIL2=C2=A0 =C2=A0 =C2=A0 4<=
br>
&gt; &gt;=C2=A0 =C2=A0#define MP2975_PAGE_NUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A02<br>
&gt; &gt;<br>
&gt; &gt; +#define MP2971_RAIL2_FUNC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | =
PMBUS_HAVE_IOUT |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT)<b=
r>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0#define MP2975_RAIL2_FUNC=C2=A0 =C2=A0(PMBUS_HAVE_VOU=
T | PMBUS_HAVE_STATUS_VOUT | \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PMBUS_HAVE_IOUT | PMBUS_HAVE_=
STATUS_IOUT | \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PMBUS_HAVE_POUT | PMBUS_PHASE=
_VIRTUAL)<br>
&gt; &gt;<br>
&gt; &gt; +struct mp2971_device_info {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int max_phase_rail1;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int max_phase_rail2;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int imvp9_en_r1_mask;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int imvp9_en_r2_mask;<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +struct mp2971_data {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct pmbus_driver_info info;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int vid_step[MP2975_PAGE_NUM];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int vout_format[MP2975_PAGE_NUM];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int vout_mode[MP2975_PAGE_NUM];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int vout_exponent[MP2975_PAGE_NUM];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int max_phase_rail1;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int max_phase_rail2;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int imvp9_en_r1_mask;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int imvp9_en_r2_mask;<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0struct mp2975_data {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pmbus_driver_info info;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int vout_scale;<br>
&gt; &gt; @@ -68,6 +91,9 @@ struct mp2975_data {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int curr_sense_gain[MP2975_PAGE_NUM];<b=
r>
&gt; &gt;=C2=A0 =C2=A0};<br>
&gt; &gt;<br>
&gt; &gt; +static const struct i2c_device_id mp2975_id[];<br>
&gt; &gt; +<br>
&gt; &gt; +#define to_mp2971_data(x) container_of(x, struct mp2971_data, in=
fo)<br>
&gt; &gt;=C2=A0 =C2=A0#define to_mp2975_data(x)=C2=A0 container_of(x, struc=
t mp2975_data, info)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int mp2975_read_byte_data(struct i2c_client *c=
lient, int page, int reg)<br>
&gt; &gt; @@ -95,6 +121,40 @@ mp2975_read_word_helper(struct i2c_client *cl=
ient, int page, int phase, u8 reg,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return (ret &gt; 0) ? ret &amp; mask : =
ret;<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; +static int<br>
&gt; &gt; +mp2971_linear2direct(struct mp2971_data *data, int page, int val=
)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* simple case */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (val =3D=3D 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* LINEAR16 does not support negative voltag=
es */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (val &lt; 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * For a static exponents, we don&#39;t have=
 a choice<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * but to adjust the value to it.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (data-&gt;vout_exponent[page] &lt; 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val &lt;&lt;=3D =
-data-&gt;vout_exponent[page];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val &gt;&gt;=3D =
data-&gt;vout_exponent[page];<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return clamp_val(val, 0, 0xffff);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int<br>
&gt; &gt; +mp2971_vid2direct(struct mp2971_data *data, int page, int val)<b=
r>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int vrf =3D data-&gt;info.vrm_version[page];=
<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (vrf =3D=3D imvp9)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (val + 29=
) * data-&gt;vid_step[page];<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return (val + 49) * data-&gt;vid_step[page];=
<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt;<br>
&gt; This looks suspicious. VID -&gt; voltage calculations should be well<b=
r>
&gt; defined and be implemented in mp2975_vid2direct(). It is not entirely<=
br>
&gt; clear why a second conversion function should be needed, and why it wo=
uld<br>
&gt; use different calculations with different results than those for<br>
&gt; mp2975.<br>
&gt;<br>
&gt; Example, for vrf =3D=3D imvp9, 10mV step size, and vid=3D=3D1:<br>
&gt;<br>
&gt; mp2971: (1 + 29) * 10 =3D 30 * 10 =3D 300<br>
&gt; mp2975: 200 + (1 - 1) * 10 =3D 200 + 0 =3D 200<br>
&gt;<br>
&gt; vid =3D 0xff =3D 255:<br>
&gt;<br>
&gt; mp2971: (255 + 29) * 10 =3D 284 * 10 =3D 2840<br>
&gt; mp2975: 200 + (255 - 1) * 10 =3D 200 + 254 * 10 =3D 2740<br>
&gt;<br>
&gt; Also questionable is how there could ever be an IMVP9 setting with 5mV=
<br>
&gt; step size since IMVP9 explicitly specifies a step size of 10mV.<br>
&gt; Also, the maximum voltage for IMVP9 is specified as 2.74V.<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int<br>
&gt; &gt;=C2=A0 =C2=A0mp2975_vid2direct(int vrf, int val)<br>
&gt; &gt;=C2=A0 =C2=A0{<br>
&gt; &gt; @@ -214,6 +274,74 @@ mp2975_read_phases(struct i2c_client *client=
, struct mp2975_data *data,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; +static int<br>
&gt; &gt; +mp2971_read_word_data(struct i2c_client *client, int page,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int phase, int reg)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0const struct pmbus_driver_info *info =3D pmb=
us_get_driver_info(client);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0struct mp2971_data *data =3D to_mp2971_data(=
info);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0switch (reg) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_OT_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_VIN_OV_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_VOUT_OV_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_VOUT_UV_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_READ_IOUT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2975_r=
ead_word_helper(client, page, phase,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 reg, GENMASK(15, 0));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_READ_VOUT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2975_r=
ead_word_helper(client, page, phase, reg,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0GENMASK(11, 0));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * READ_VOUT can=
 be provided in VID or direct format. The<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * format type i=
s specified by bit 15 of the register<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * MP2971_MFR_DC=
_LOOP_CTRL. The driver enforces VOUT direct<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * format, since=
 device allows to set the different formats for<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * the different=
 rails and also all VOUT limits registers are<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * provided in a=
 direct format. In case format is VID - convert<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * to direct.<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (data-&gt=
;vout_format[page]) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case linear:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ret =3D mp2971_linear2direct(data, page, ret);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case vid:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ret =3D mp2971_vid2direct(data, page, ret);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case direct:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -ENODATA;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_UT_WARN_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_UT_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_VIN_UV_WARN_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_VIN_UV_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_VOUT_UV_WARN_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_VOUT_OV_WARN_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_VIN_OV_WARN_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_IIN_OC_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_IOUT_OC_LV_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_IIN_OC_WARN_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_IOUT_OC_WARN_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_IOUT_OC_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_IOUT_UC_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_POUT_OP_FAULT_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_POUT_OP_WARN_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0case PMBUS_PIN_OP_WARN_LIMIT:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODATA;=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt;<br>
&gt; Much of that code seems duplicate from mp2975_read_word_data().<br>
&gt; Without datasheets I can not determine if this really makes sense<br>
&gt; and/or is needed, or if a single function can be used for all chips.<b=
r>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0static int mp2975_read_word_data(struct i2c_client *c=
lient, int page,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int phase, int reg)<br>
&gt; &gt;=C2=A0 =C2=A0{<br>
&gt; &gt; @@ -365,6 +493,63 @@ mp2975_set_phase_rail2(struct pmbus_driver_i=
nfo *info, int num_phases)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;pf=
unc[MP2975_MAX_PHASE_RAIL1 - i] =3D PMBUS_HAVE_IOUT;<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; +static int mp2971_identify_multiphase(struct i2c_client *client,=
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mp2971=
_data *data,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pmbus_=
driver_info *info)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_write_byte_data(client, PM=
BUS_PAGE, 2);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Identify multiphase for rail 1 - could be=
 from 1 to 12. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_read_word_data(client, MP2=
975_MFR_VR_MULTI_CONFIG_R1);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt;=3D 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0info-&gt;phases[0] =3D ret &amp; GENMASK(3, =
0);<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * The device provides a total of 8 PWM pins=
, and can be configured<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * to different phase count applications for=
 rail 1 and rail 2.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * Rail 1 can be set to 8 phases, while rail=
 2 can only be set to 4<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * phases at most. When rail 1=E2=80=99s pha=
se count is configured as 0, rail<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * 1 operates with 1-phase DCM. When rail 2 =
phase count is configured<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 * as 0, rail 2 is disabled.<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (info-&gt;phases[0] &gt; data-&gt;max_pha=
se_rail1)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; +}<br>
&gt;<br>
&gt; Same here. The code is almost the same as mp2975_identify_multiphase()=
.<br>
&gt; Again, without datasheets I can not determine if this really makes sen=
se<br>
&gt; and/or is needed, or if a single function can be used for all chips.<b=
r>
&gt;<br>
&gt; This is a recurring problem. It appears that the patch maximizes the<b=
r>
&gt; changes against the current code instead of even trying to minimize th=
em.<br>
&gt; Without datasheet, it is impossible to compare the chips to check if a=
n<br>
&gt; implementation with fewer / less extensive changes would be warranted.=
<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +static int<br>
&gt; &gt; +mp2971_identify_vid(struct i2c_client *client, struct mp2971_dat=
a *data,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0struct pmbus_driver_info *info, u32 reg, int page,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0u32 imvp_bit, u32 vr_bit)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Identify VID mode and step selection. */<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_read_word_data(client, reg=
);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret &amp; imvp_bit) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;vrm_ver=
sion[page] =3D imvp9;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;vid_ste=
p[page] =3D MP2975_PROT_DEV_OV_OFF;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0} else if (ret &amp; vr_bit) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;vrm_ver=
sion[page] =3D vr12;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;vid_ste=
p[page] =3D MP2975_PROT_DEV_OV_ON;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;vrm_ver=
sion[page] =3D vr13;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;vid_ste=
p[page] =3D MP2975_PROT_DEV_OV_OFF;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0static int<br>
&gt; &gt;=C2=A0 =C2=A0mp2975_identify_multiphase(struct i2c_client *client,=
 struct mp2975_data *data,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 struct pmbus_driver_info *info)<br>
&gt; &gt; @@ -428,6 +613,68 @@ mp2975_identify_vid(struct i2c_client *clien=
t, struct mp2975_data *data,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; +static int<br>
&gt; &gt; +mp2971_identify_rails_vid(struct i2c_client *client, struct mp29=
71_data *data,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pmbus_driver=
_info *info)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbus_write_byte_data(client, PM=
BUS_PAGE, 2);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Identify VID mode for rail 1. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mp2971_identify_vid(client, data, in=
fo,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MP2975_MFR_VR_MULTI_CONFIG_=
R1, 0,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;imvp9_en_r1_mask,<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MP2975_VID_STEP_SEL_R1);<br=
>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* Identify VID mode for rail 2, if connecte=
d. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (info-&gt;phases[1])<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2971_i=
dentify_vid(client, data, info,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MP2975_MFR_VR_MULTI_CONFIG_R2, 1,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0data-&gt;imvp9_en_r2_mask,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0MP2975_VID_STEP_SEL_R2);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int mp2971_identify_vout_format(struct i2c_client *client=
,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mp297=
1_data *data,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pmbus=
_driver_info *info)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int i, ret, vout_mode;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; info-&gt;pages; i++) {<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbu=
s_write_byte_data(client, PMBUS_PAGE, i);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D i2c_smbu=
s_read_byte_data(client, PMBUS_VOUT_MODE);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vout_mode =3D re=
t;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (vout_mod=
e &gt;&gt; 5) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 0:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;vout_format[i] =3D linear;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;vout_exponent[i] =3D ((s8)(vout_mode &lt;&lt; 3)) &gt=
;&gt; 3;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 1:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;vout_format[i] =3D vid;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case 2:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;vout_format[i] =3D direct;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -ENODEV;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0static int<br>
&gt; &gt;=C2=A0 =C2=A0mp2975_identify_rails_vid(struct i2c_client *client, =
struct mp2975_data *data,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct pmbus_driver_info *info)<br>
&gt; &gt; @@ -659,6 +906,24 @@ mp2975_vout_per_rail_config_get(struct i2c_c=
lient *client,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; +static struct pmbus_driver_info mp2971_info =3D {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.pages =3D 1,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.format[PSC_VOLTAGE_IN] =3D linear,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.format[PSC_VOLTAGE_OUT] =3D direct,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.format[PSC_TEMPERATURE] =3D linear,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.format[PSC_CURRENT_IN] =3D linear,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.format[PSC_CURRENT_OUT] =3D linear,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.format[PSC_POWER] =3D linear,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.m[PSC_VOLTAGE_OUT] =3D 1,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.R[PSC_VOLTAGE_OUT] =3D 3,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.func[0] =3D PMBUS_HAVE_VIN | PMBUS_HAVE_VOU=
T | PMBUS_HAVE_STATUS_VOUT |<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PMBUS_HA=
VE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PMBUS_HA=
VE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PMBUS_HA=
VE_PIN | PMBUS_HAVE_STATUS_INPUT,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.read_byte_data =3D mp2975_read_byte_data,<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.read_word_data =3D mp2971_read_word_data,<b=
r>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0static struct pmbus_driver_info mp2975_info =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.pages =3D 1,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.format[PSC_VOLTAGE_IN] =3D linear,<br>
&gt; &gt; @@ -683,63 +948,131 @@ static struct pmbus_driver_info mp2975_inf=
o =3D {<br>
&gt; &gt;=C2=A0 =C2=A0static int mp2975_probe(struct i2c_client *client)<br=
>
&gt; &gt;=C2=A0 =C2=A0{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pmbus_driver_info *info;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0struct mp2975_data *data;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0char *name;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0data =3D devm_kzalloc(&amp;client-&gt;dev, s=
izeof(struct mp2975_data),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (!data)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0name =3D (char *)i2c_match_id(mp2975_id, cli=
ent)-&gt;name;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0memcpy(&amp;data-&gt;info, &amp;mp2975_info,=
 sizeof(*info));<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0info =3D &amp;data-&gt;info;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!name)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<=
br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* Identify multiphase configuration for rai=
l 2. */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mp2975_identify_multiphase_rail2(cli=
ent);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!strcmp(name, &quot;mp2971&quot;) || !st=
rcmp(name, &quot;mp2973&quot;)) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mp2971_da=
ta *data;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mp2971_de=
vice_info *device_info;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Two rails are=
 connected. */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;info.pa=
ges =3D MP2975_PAGE_NUM;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;info.ph=
ases[1] =3D ret;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data-&gt;info.fu=
nc[1] =3D MP2975_RAIL2_FUNC;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D devm_kz=
alloc(&amp;client-&gt;dev, sizeof(struct mp2971_data),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KE=
RNEL);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -ENOMEM;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* Identify multiphase configuration. */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mp2975_identify_multiphase(client, d=
ata, info);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0device_info =3D<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(struct mp2971_device_info *)i2c_match_id(mp2975_id, client)<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt;driver_data;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* Identify VID setting per rail. */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mp2975_identify_rails_vid(client, da=
ta, info);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;data=
-&gt;info, &amp;mp2971_info, sizeof(*info));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D &amp;da=
ta-&gt;info;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* Obtain current sense gain of power stage.=
 */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mp2975_current_sense_gain_get(client=
, data);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (device_info)=
 {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;imvp9_en_r1_mask =3D device_info-&gt;imvp9_en_r1_mask=
;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;imvp9_en_r2_mask =3D device_info-&gt;imvp9_en_r2_mask=
;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;max_phase_rail1 =3D device_info-&gt;max_phase_rail1;<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;max_phase_rail2 =3D device_info-&gt;max_phase_rail2;<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* Obtain voltage reference values. */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mp2975_vref_get(client, data, info);=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Identify mult=
iphase configuration for rail 2. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2975_i=
dentify_multiphase_rail2(client);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* Obtain vout over-voltage scales. */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mp2975_vout_ov_scale_get(client, dat=
a, info);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Two rails are connected. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;info.pages =3D MP2975_PAGE_NUM;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;info.phases[1] =3D ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;info.func[1] =3D MP2971_RAIL2_FUNC;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0/* Obtain offsets, maximum and format for vo=
ut. */<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0ret =3D mp2975_vout_per_rail_config_get(clie=
nt, data, info);<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Identify mult=
iphase configuration. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2971_i=
dentify_multiphase(client, data, info);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Identify VID =
setting per rail. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2971_i=
dentify_rails_vid(client, data, info);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Identify vout=
 format. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2971_i=
dentify_vout_format(client, data, info);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mp2975_da=
ta *data;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data =3D devm_kz=
alloc(&amp;client-&gt;dev, sizeof(struct mp2975_data),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KE=
RNEL);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!data)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return -ENOMEM;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;data=
-&gt;info, &amp;mp2975_info, sizeof(*info));<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D &amp;da=
ta-&gt;info;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Identify mult=
iphase configuration for rail 2. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2975_i=
dentify_multiphase_rail2(client);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Two rails are connected. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;info.pages =3D MP2975_PAGE_NUM;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;info.phases[1] =3D ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data-&gt;info.func[1] =3D MP2975_RAIL2_FUNC;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Identify mult=
iphase configuration. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2975_i=
dentify_multiphase(client, data, info);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Identify VID =
setting per rail. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2975_i=
dentify_rails_vid(client, data, info);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Obtain curren=
t sense gain of power stage. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2975_c=
urrent_sense_gain_get(client, data);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Obtain voltag=
e reference values. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2975_v=
ref_get(client, data, info);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Obtain vout o=
ver-voltage scales. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2975_v=
out_ov_scale_get(client, data, info);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Obtain offset=
s, maximum and format for vout. */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mp2975_v=
out_per_rail_config_get(client, data, info);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0return ret;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return pmbus_do_probe(client, info);<br=
>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; +static const struct mp2971_device_info mp2971_device_info =3D {<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.imvp9_en_r1_mask =3D BIT(14),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.imvp9_en_r2_mask =3D BIT(13),<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.max_phase_rail1 =3D 8,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0.max_phase_rail2 =3D 4,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0static const struct i2c_device_id mp2975_id[] =3D {<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0{&quot;mp2971&quot;, (kernel_ulong_t)&amp;mp=
2971_device_info },<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0{&quot;mp2973&quot;, (kernel_ulong_t)&amp;mp=
2971_device_info },<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{&quot;mp2975&quot;, 0},<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{}<br>
&gt; &gt;=C2=A0 =C2=A0};<br>
&gt;<br>
</blockquote></div></div>

--00000000000093848105f283526a--
