Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BCA91B50
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 04:57:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BdrS1mpPzDr7F
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 12:57:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sXAUC0Vs"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bdqn0QJczDqgq
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 12:56:52 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id g2so280369pfq.0
 for <openbmc@lists.ozlabs.org>; Sun, 18 Aug 2019 19:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8KUldHqdiyJfIYKI91smI3BWWSLCesS4OFhanXdAB/8=;
 b=sXAUC0VsPZ95/x3N+AJoCZaVM9xS1RsBjh1x32rDiJer2EZDEL5FRDXLQhowUIipwZ
 Ol7LpEgSmYsZX0Q1AC9+esB45wtPow6MUvTI4jY0xqpwXhSDP6M6NxiMMYKpM5/JyUz4
 nWFYnzpGn8T6XgEfyJZwQzwQry8qtUrCRlvBXvqCdjqU8pxHdxS1DbbMDFhwTazG78Y9
 25Uo7881pnKWUgzPR9qqHMFInYdW0si0OmvnNnm63a94a6bTX4IIyn4AL6QTebL+9J+Q
 cmcBhbRNrnhYphMBq7LvfyBfMtZOE82vkXXiVOhQ56qZOpZSLavb3O0lf8sFz3hTlUob
 LLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8KUldHqdiyJfIYKI91smI3BWWSLCesS4OFhanXdAB/8=;
 b=NQwT0TGbobHpH9TyhcpXMlPG5P2IiayAwG1yDhQzlqB3guOH8we4xTyxc4+TXTfT1t
 Y9dJC9fflzk61b0Pm+R4QSw/D8rPiMus2/RdG2HT6TUqiPDo0frHFmrF60amNdu6/P+0
 kwTFL0w5yUEIRYR/ogMuJMGnvBiwAKE02Zx4p7ehqJafZPvFp4iQjRkUrcH7bWlqw0Jy
 K22X8ctzZmhLzJXJQFD0NNImlvqR74ceiR1sIBAO4Eis+SsATh4mfqcFduISwIJoklMY
 TlmzZeIGqKCO8z8UffEle4udGXabSQARuCVQi1gbI3XWk96OcyId3OoOrtGAMOKVE90B
 WQ+Q==
X-Gm-Message-State: APjAAAXUZnIqTjBq7imgQH6+C/CjpMYM7s3NM3IW26fdNfGm0m0GDRoE
 WUOQu0lqiGTrqDwH1mIzuJM=
X-Google-Smtp-Source: APXvYqzdebKbzf683EonE73ov8DQqsTH4NZnIqlhEvoNm5ygQFU9oeZxDW4BBWxfXZGqHc12vT2ubQ==
X-Received: by 2002:a63:595d:: with SMTP id j29mr18224659pgm.134.1566183409576; 
 Sun, 18 Aug 2019 19:56:49 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id s72sm16976535pgc.92.2019.08.18.19.56.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Aug 2019 19:56:48 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] hwmon: pmbus: Add Inspur Power System power supply
 driver
To: Joel Stanley <joel@jms.id.au>, John Wang <wangzqbj@inspur.com>
References: <20190816101944.3586-1-wangzqbj@inspur.com>
 <CACPK8XegTePdmykMzZHnW=g6hyEGr7jiW3TP8AvdzSwZGr=2gA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8c6a287f-49f0-bb36-71d0-2bce8eb19ff9@roeck-us.net>
Date: Sun, 18 Aug 2019 19:56:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XegTePdmykMzZHnW=g6hyEGr7jiW3TP8AvdzSwZGr=2gA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-doc@vger.kernel.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 duanzhijia01@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/18/19 7:20 PM, Joel Stanley wrote:
> On Fri, 16 Aug 2019 at 10:19, John Wang <wangzqbj@inspur.com> wrote:
>>
>> Add the driver to monitor Inspur Power System power supplies
>> with hwmon over pmbus.
>>
>> This driver adds sysfs attributes for additional power supply data,
>> including vendor, model, part_number, serial number,
>> firmware revision, hardware revision, and psu mode(active/standby).
>>
>> Signed-off-by: John Wang <wangzqbj@inspur.com>
> 
>> +static const struct i2c_device_id ipsps_id[] = {
>> +       { "inspur_ipsps1", 0 },
> 
> Convention would be to use "ipsps" here, instead of "vendor_device"?

ipsps1, but good catch.

>> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, ipsps_id);
>> +
>> +static const struct of_device_id ipsps_of_match[] = {
>> +       { .compatible = "inspur,ipsps1" },
>> +       {}
>> +};
>> +MODULE_DEVICE_TABLE(of, ipsps_of_match);
> 
> Do we need the of match table? I thought the match on the device name
> from the i2c table would be enough. I will defer to Guenter here
> though.
> 

Strictly speaking it is unnecessary, but it is kind of customary to have it.
The automatic detection also only works if the i2c device ID would be "ipsps1",
without vendor ID embedded.

I would recomment to have both, but name the i2c device "ipsps1" as you suggested,
for consistency.

I'll also have to check if we need of_match_ptr below in the assignment of
of_match_table. Probably not, but it would save a few bytes if CONFIG_OF
is not enabled.

Thanks,
Guenter


> Assuming the device tables are okay:
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Cheers,
> 
> Joel
> 
>> +
>> +static struct i2c_driver ipsps_driver = {
>> +       .driver = {
>> +               .name = "inspur-ipsps",
>> +               .of_match_table = ipsps_of_match,
>> +       },
>> +       .probe = ipsps_probe,
>> +       .remove = pmbus_do_remove,
>> +       .id_table = ipsps_id,
>> +};
> 

