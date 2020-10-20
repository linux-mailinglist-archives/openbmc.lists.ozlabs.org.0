Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A60293D9C
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 15:48:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFw261S4wzDqkJ
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 00:48:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Mmne/inY; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFvzw6TMtzDqhN
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 00:46:36 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KDhw2A104035
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 09:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sivvrTtGE0eN3danVOz1O+AaBtGsE8WhKN/alC5X4gU=;
 b=Mmne/inYYTKGiaVV6sCOq/XtynC33ff81+iNSkFpkBiauEDRDOiFZ/DYmIJfDQ36nTX5
 7Fo8SeL7dS5rZHDm8scIgi0jNeKS0mGqLKtNpuENFjN5WehAoeLQqliL9lXFCO3vOhmx
 ECVc4o/wz/BOPw5nI4grL/LxME7ki5SV5c5fulbsMq2F2riTHg9wE11xhwnjB/vKlhuM
 B7nKhAAxumvAEMXQUU6RT5tnHRaCe5TesOPI4Rc31jiCp35VB4aLvHJsv0IGSqRkq3vE
 ndPGT3o2Q32jYHT8FLjll+TTaSfuWvAqk+JZ69FQrAqfT/fiHPm2G2iE1K2DjaK4Vurm oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34a11fr319-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 09:46:32 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09KDi7Mr104583
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 09:46:32 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34a11fr30v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 09:46:32 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09KDaptb012324;
 Tue, 20 Oct 2020 13:46:32 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 347r8905ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 13:46:32 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09KDkVxL51380600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Oct 2020 13:46:31 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BBC3124055;
 Tue, 20 Oct 2020 13:46:31 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4237A124052;
 Tue, 20 Oct 2020 13:46:31 +0000 (GMT)
Received: from [9.160.87.233] (unknown [9.160.87.233])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 20 Oct 2020 13:46:31 +0000 (GMT)
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Thu Ba Nguyen <tbnguyen1985@gmail.com>
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <4ff7b0cc-8e61-7fa7-19be-8427f281a0fc@linux.ibm.com>
 <CALioo37dj3UbSoi7nEb+N9uFjvB5iUxNF8evMQ4K9HYcaObsjg@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <2ac65a96-a447-e5b6-037d-2d785c16244b@linux.ibm.com>
Date: Tue, 20 Oct 2020 08:46:30 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <CALioo37dj3UbSoi7nEb+N9uFjvB5iUxNF8evMQ4K9HYcaObsjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-20_06:2020-10-20,
 2020-10-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010200091
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 10/19/2020 10:23 AM, Thu Ba Nguyen wrote:
> Thanks for your reply Matt Spinler, Can you show me the discussion 
> threads? I also...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> Thanks for your reply Matt Spinler,
>
> Can you show me the discussion threads?

Sure: https://lists.ozlabs.org/pipermail/openbmc/2019-October/018967.html

>
> I also thought about the solution for that features:
> In the current hwmon we support GPIOCHIP + GPIO option which used to 
> enable sensors to read. In the hwmon code, we just set that pin and 
> wait before reading.
> I think we can support a similar option named GPIOENABLE + GPIOV. When 
> the status of Gpio pin defind in GPIOEANBLE match with GPIOV.
> That sensors will be read and update to Dbus.
> If not it will be removed from DBus until the GPIO pin math GPIOV.
> Maybe we can have many different solutions.

As Ed mentioned, I think a good direction to start with is how 
dbus-sensors handles it, so we  can have
common behavior.  I believe they look at the host state D-Bus property 
and still keep the sensor
on D-Bus even when power is off.

>
> If you don't mind, can you tell me how IBM supports that features?

We lucked out out in that the driver was only loaded when power was on.

>
> Regards.
> Thu Nguyen.
>
> On Mon, Oct 19, 2020 at 9:16 PM Matt Spinler <mspinler@linux.ibm.com 
> <mailto:mspinler@linux.ibm.com>> wrote:
>
>
>
>     On 10/18/2020 8:58 AM, Thu Ba Nguyen wrote:
>     > Dear, I'm supporting the host sensors for Ampere Computing LLC
>     > platform. We are...
>     > This Message Is From an External Sender
>     > This message came from outside your organization.
>     >
>     > Dear,
>     >
>     > I'm supporting the host sensors for Ampere Computing LLC platform.
>     > We are using phosphor-hwmon to update values of sensors and
>     monitoring
>     > sensors warning/errors base on threshold setting.
>     >
>     > There are some sensors which are turned off when host Off. It
>     can be
>     > the sensors reported by host or voltage/temperature/power sensors
>     >  which use the same power source with host.
>     >
>     > I researched in openBmc sensor-architecture documents but can't
>     find
>     > any option to enable/disable sensors base on one status or GPIO
>     pins.
>     > I can't use REMOVERCS.
>     >
>     > Research in phosphor-hwmon code, I don't see the answer too.
>     >
>     > Do we have any options/solution to Enable/Disable some sensors when
>     > Host On/Off?
>
>     Hi,
>     The phosphor-hwmon code doesn't support that yet.  It has been
>     discussed
>     before but nobody
>     has implemented it.
>
>     >
>     > Thanks.
>     > Thu Nguyen.
>

