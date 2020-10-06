Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF25284432
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 05:14:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C52d45WK8zDqJ2
	for <lists+openbmc@lfdr.de>; Tue,  6 Oct 2020 14:14:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ioUzWxbX; dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C52cL4YJXzDqH6
 for <openbmc@lists.ozlabs.org>; Tue,  6 Oct 2020 14:13:54 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id i12so5092052ota.5
 for <openbmc@lists.ozlabs.org>; Mon, 05 Oct 2020 20:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YhkwckyNp6WfxaWpDShWfy9L42iKZ4jOtBl9eLfn3Fs=;
 b=ioUzWxbXmPR2u+5eY5AVcms+s0c0VISF4yxTFx6x0MPjTlCqnrg25+QCrzft7a9iWH
 t3vZ6bX1nUC7Rv9EviYQGB5xD22l7i19y17dUmJFxgC3cFhlozy3eHRGPY/GuEpCl0uh
 wjoF1Ly4IMKj2Z2JG+p43WTPb3abRttgFY7KI3v0WH13x+e7LE7jRqpUswFhHa8g+XL/
 /qrHnWERYKK/zoz0Lyhqi11MXMZBZ7p1qkDJ/afp27KowdqZipRAMuawo91So2txnWa8
 HkFmBaunKbsrHiVHRFxpK/IpZM2FY8DMCAezPWvtRn2d4jcZMSNr47kSLT4rux6rIGM4
 DBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=YhkwckyNp6WfxaWpDShWfy9L42iKZ4jOtBl9eLfn3Fs=;
 b=YIGUoDnuGxCRyevBfjH/zJRa8KL16s0w52t/nkNu0Glci2k/RHqARA9cWWBNFrMlOc
 qDnp/LEgx4hh4VrdNJJIz51EzdPL4idwUY44Jpar89lTpNGfy7WgW+nZ88DksxUHm35+
 ynesVbq+6bLl2QxWqCMMJ/AV3bw3mKmLOMc3jg2GLa2YxuMhu/atTiCJVeOjMxPxqdac
 Le3nZxMZNP1thUU81kRXOGOVnTkQ6jbk8t1/S5tnOp/0IDjsxjasnlyiIIcQLuTYNFeQ
 ynwFzcNT/HILtMFLoSxSSCZDbJg5x5hb5YW9k25p5Bj3FpYFOqIKDGPW+Z1l2/Bfpr6X
 HNOg==
X-Gm-Message-State: AOAM5327v0+o9dxDewOlxLa3av/SRKr2jpgMjZEI3LwjYE0gm0fX5wpF
 /r3GnXYlO6GI69gm2xq4MNU=
X-Google-Smtp-Source: ABdhPJxc7fj/2lasTxWaCK4CdhfvWnBUi2VbINfeWvv7312xK0LcWqI/KXGYNohgJtoJV6XalMgBYg==
X-Received: by 2002:a9d:58cd:: with SMTP id s13mr1610088oth.12.1601954030664; 
 Mon, 05 Oct 2020 20:13:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d28sm557766ooa.7.2020.10.05.20.13.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2020 20:13:49 -0700 (PDT)
Subject: Re: [PATCH linux dev-5.8] hwmon: Ampere Computing ALTRA SMPMPRO
 sensor driver
To: Joel Stanley <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>,
 linux-hwmon@vger.kernel.org
References: <1601504817-16752-1-git-send-email-lancelot.kao@fii-usa.com>
 <20201001123249.GC6152@heinlein>
 <CACPK8XewuMZTvhh7QA6iBbkH5AqQWS9RVeZXaAF-XzAYhYsG1A@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <384f0c15-1c53-7ab1-aedc-af215e73f04a@roeck-us.net>
Date: Mon, 5 Oct 2020 20:13:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XewuMZTvhh7QA6iBbkH5AqQWS9RVeZXaAF-XzAYhYsG1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Lancelot <lancelot.kao@fii-usa.com>,
 Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/5/20 4:05 PM, Joel Stanley wrote:
> On Thu, 1 Oct 2020 at 12:32, Patrick Williams <patrick@stwcx.xyz> wrote:
>>
>> On Wed, Sep 30, 2020 at 05:26:57PM -0500, Lancelot wrote:
>>> From: Lancelot Kao <lancelot.kao@fii-usa.com>
>>>
>>> Add SMPMPro-hwmon driver to monitor Ampere CPU/Memory/VR via an
>>> i2c interface of the CPU's smpmpro management device.
>>>
>>> Signed-off-by: Xiaopeng XP Chen <xiao-peng.chen@fii-na.com>
>>> Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
>>
>> Nice work at adding this driver.
>>
>> It does look like you've missed CC'ing upstream though.  Was this
>> intentional?  (linux-hwmon@vger.kernel.org)
> 
> As Patrick mentioned, let's review this on the upstream list.
> 

I can not really comment, not having seen the entire patch.
However, looking it up on the OpenBMC patchwork, couple of
high level comments:

- Label attributes are handled by the hwmon core. Label attributes
  outside the core are unacceptable.
- There is no discussion about the non-standard attributes, nor a description
  of those, nor an explanation for why they are needed (as hwmon sysfs attributes)
  or what they report. This is unacceptable.
  Besides, many of those attributes - say, gpi22_input, which seems to report
  the content of GPI_WDT_STS_REG, suggesting association with a watchdog -
  seem inappropriate for a hwmon driver to start with. It seems like the
  hwmon driver us used as catch-all driver for this chip. Sorry,
  that is an absolute no-go.

If this patch is supposed to be submitted as upstream patch, I would suggest
to read and follow the guidance in Documentation/hwmon/submitting-patches.rst.

Guenter

> Cheers,
> 
> Joel
> 
>>
>>> +/* Capability Registers  */
>>> +#define TEMP_SENSOR_SUPPORT_REG      0x05
>>> +#define PWR_SENSOR_SUPPORT_REG       0x06
>>> +#define VOLT_SENSOR_SUPPORT_REG      0x07
>>> +#define OTHER_CAP_REG                    0x08
>>> +#define CORE_CLUSTER_CNT_REG 0x0B
>>> +#define SYS_CACHE_PCIE_CNT_REG       0x0C
>>> +#define SOCKET_INFO_REG              0x0D
>>
>> There seems to be some sporatic indentation throughout all the #defines
>> in this file, where it appears you attempted to align the values.  Make
>> sure you have tabs set to 8-step spacing for kernel code.
>>
>>> +static void smpmpro_init_device(struct i2c_client *client,
>>> +                             struct smpmpro_data *data)
>>> +{
>>> +     u16 ret;
>>> +
>>> +     ret = i2c_smbus_read_word_swapped(client, TEMP_SENSOR_SUPPORT_REG);
>>> +     if (ret < 0)
>>> +             return;
>>> +     data->temp_support_regs = ret;
>>
>> i2c_smbus_read_word_swapped returns a s32 even though you're looking for
>> a u16.  By setting `ret` to u16 you've caused two problems:
>>
>>     * You are immediately truncating -ERRNO values into a u16 so that
>>       you are unable to differentiate values like 0xFFFFFFFF as a
>>       register value and -1 as an errno.
>>
>>     * The if condition here can never be true, so you're never catching
>>       error conditions.  (An u16 can never be negative, so ret < 0 can
>>       never be true.)
>>
>> This issue occurs throughout the driver.
>>
>>> +static int smpmpro_read_temp(struct device *dev, u32 attr, int channel,
>>> +                          long *val)
>>> +{
>>> +     struct smpmpro_data *data = dev_get_drvdata(dev);
>>> +     struct i2c_client *client = data->client;
>>> +     int ret;
>>
>> You might want a sized int on this one?  Repeated in most other
>> functions.
>>
>>> +static int smpmpro_read_power(struct device *dev, u32 attr, int channel,
>>> +                          long *val)
>>> +{
>>> +     struct smpmpro_data *data = dev_get_drvdata(dev);
>>> +     struct i2c_client *client = data->client;
>>> +     int ret, ret_mw;
>>> +     int ret2 = 0, ret2_mw = 0;
>>
>> Any reason to not initialize ret/ret_mw?  By it being different from
>> ret2/ret2_mw it makes me question "is this ok?", which spends more time
>> in review.
>>
>>> +static int smpmpro_i2c_probe(struct i2c_client *client,
>>> +                       const struct i2c_device_id *id)
>> ...
>>> +     /* Initialize the Altra SMPMPro chip */
>>> +     smpmpro_init_device(client, data);
>>
>> I didn't see anything in the smpmpro_init_device function, but is there
>> anything you can or should do to ensure this device really is an
>> SMPMPro rather than exclusively relying on the device tree compatible?
>>
>>> +static struct i2c_driver smpmpro_driver = {
>>> +     .class          = I2C_CLASS_HWMON,
>>> +     .probe          = smpmpro_i2c_probe,
>>> +     .driver = {
>>> +             .name   = "smpmpro",
>>> +     },
>>> +     .id_table       = smpmpro_i2c_id,
>>> +};
>>> +
>>> +module_i2c_driver(smpmpro_driver);
>>
>> Are you missing the .of_match_table inside .driver?  Is that necessary
>> or useful for your use?  I'm not sure if you can have device tree
>> entries that automatically instantiate the hwmon driver otherwise.
>>
>> --
>> Patrick Williams

