Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C08F2408266
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 02:25:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H76gx4Zdkz2yKJ
	for <lists+openbmc@lfdr.de>; Mon, 13 Sep 2021 10:25:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=metafoo.de header.i=@metafoo.de header.a=rsa-sha256 header.s=default2002 header.b=RXk8HRD4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=metafoo.de (client-ip=78.46.137.84; helo=www381.your-server.de;
 envelope-from=lars@metafoo.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=metafoo.de header.i=@metafoo.de header.a=rsa-sha256
 header.s=default2002 header.b=RXk8HRD4; 
 dkim-atps=neutral
X-Greylist: delayed 1306 seconds by postgrey-1.36 at boromir;
 Thu, 09 Sep 2021 17:34:46 AEST
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4rPL1R6Sz2xXx
 for <openbmc@lists.ozlabs.org>; Thu,  9 Sep 2021 17:34:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=G7K1+ASbNAT0M15fHoSo6raThgpx63J6G5EfX8D7W2c=; b=RXk8HRD4+DsEfmn38nZK0tVtjx
 Y8LlnkSnHiuM5+AfVrGC0XE/FnAtfEk783pO+L/LSeojwD2mOBZpZvkzjs1IDQ3GN+tjHznP1wLJ4
 nA/f7FdorNcXBFOnFZtyq75uXdKQ6ibLYHaYV8/g9nth80ArrvLbKPQz8d8dORdYK+i8DNS9vwktZ
 S+lOT9E+bBut0XO57ufBGwZQx1syWcGvVc6pYl8HPhHfa6tuWaLvaJd1fKJIK1xKQSqUDmsUOiW1K
 4U37W4ti8YZ/DK0gaQPW6FA5coiwtzLBJ7czzqnwtPujfVtrZzdBeXC7SnkGH+Z40MU09KmxN15mK
 yKeed0lQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mOEEt-0005Qp-4h; Thu, 09 Sep 2021 09:12:51 +0200
Received: from [62.216.202.248] (helo=[192.168.178.20])
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mOEEs-000Vkn-Tt; Thu, 09 Sep 2021 09:12:51 +0200
Subject: Re: Looking for clarification on sysfs IIO devices, do _raw devices
 require both _offset and _scale?
To: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>,
 linux-iio@vger.kernel.org
References: <cc74f30f-9ab8-45ce-1f44-8e55c3f9c5ce@linux.vnet.ibm.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <5c79425f-6e88-36b6-cdfe-4080738d039f@metafoo.de>
Date: Thu, 9 Sep 2021 09:12:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cc74f30f-9ab8-45ce-1f44-8e55c3f9c5ce@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.2/26288/Wed Sep  8 10:22:21 2021)
X-Mailman-Approved-At: Mon, 13 Sep 2021 10:24:58 +1000
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/9/21 12:10 AM, Bruce Mitchell wrote:
> In reference to:
> https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-iio
>
> I have Temperature, Pressure, and Humidity IIO sensors.
> IIO _raw devices look like this on sysfs:
>   this happens to be a SI7020 type device with 2 sensors
>     /sys/bus/iio/devices/iio:device0/in_humidityrelative_offset
>     /sys/bus/iio/devices/iio:device0/in_humidityrelative_raw
>     /sys/bus/iio/devices/iio:device0/in_humidityrelative_scale
>     /sys/bus/iio/devices/iio:device0/in_temp_offset
>     /sys/bus/iio/devices/iio:device0/in_temp_raw
>     /sys/bus/iio/devices/iio:device0/in_temp_scale
>
> Other IIO _input devices look like this on sysfs:
>   this happens to be a DPS310 device with 2 sensors
>      /sys/bus/iio/devices/iio:device1/in_temp_input
>      /sys/bus/iio/devices/iio:device1/in_pressure_input
>
> As I read it if the IIO device was an _input type on sysfs,
> just read it (and possibly scale it for units).
>
> But if the IIO device was a _raw type on sysfs my understanding
> is that it must be accompanied by a _offset and a _scale for
> at least temperature, pressure, humidity, voltage, and current
> sensors.
> Is that correct?
>
> Further for any IIO device that is a _raw type on sysfs is it
> required to be accompanied by a _offset and a _scale as well?

Hi,

That sounds about right.

The _input name is historically and comes from hwmon framework. It means 
that the data has been processed by the kernel driver and converted to 
the right SI units for the channel type. This is usually used for sensor 
that have a non-linear transfer function. `raw` on the other hand means 
the data is just as it is reported by the hardware. The reason for this 
is that conversion to SI units is often not lossless, since we have 
finite precision. So it is up to the application to decide whether it 
wants to work on the raw data or how it wants to round the converted data.

`input` attributes never have scale and offset since they are already in 
the right unit. For raw scale and offset are optional. If scale does not 
exist assume it is 1, if offset does not exist assume it is 0. You'll 
rarely see a device with raw attributes without scale, but there are 
quite a few without offset.

- Lars


