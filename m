Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9685D52A218
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:53:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bdG3wWtz3c8R
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:53:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=NQX/7KbE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=samsung.com (client-ip=203.254.224.34; helo=mailout4.samsung.com;
 envelope-from=cw00.choi@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256
 header.s=mail20170921 header.b=NQX/7KbE; 
 dkim-atps=neutral
X-Greylist: delayed 607 seconds by postgrey-1.36 at boromir;
 Tue, 17 May 2022 12:59:35 AEST
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2LSR1hh5z30Lk
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 12:59:33 +1000 (AEST)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20220517024906epoutp04542529d3e36b7f7fc4e982cb8e373553~vxJgmQj7f1411514115epoutp04m
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 02:49:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20220517024906epoutp04542529d3e36b7f7fc4e982cb8e373553~vxJgmQj7f1411514115epoutp04m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652755746;
 bh=m8MmM8ZpNLaHPx5XCo4DcWLCrHO3tBmGGFvelMK1O/Y=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=NQX/7KbEth7d+h6DPxDX9MZEM6hYs1U0Rz5Sj31WAykrrn2f+E3lPT1Tc0J0vN/sS
 RMm3Wl176ZHY/BFYrHmF5WpRZMa+YHkNfgdh6YUwdsQZMpe2DpPI6F+aVYvvV2/5qc
 6h/qxae1hY2Pm3JI8uHWR2AVKie1wF6/P6t82fhY=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220517024905epcas1p1c22d497c3d23b92a2aca2ba8007411b7~vxJf9crsm1719217192epcas1p1P;
 Tue, 17 May 2022 02:49:05 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.36.145]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4L2LDJ1Lq1z4x9Pt; Tue, 17 May
 2022 02:49:04 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 CA.5E.10354.02D03826; Tue, 17 May 2022 11:49:04 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220517024903epcas1p2e146717a160c3dfbe42a8fa97a7280af~vxJecEnmz2519525195epcas1p2j;
 Tue, 17 May 2022 02:49:03 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220517024903epsmtrp297f61c339114860407154d82fd99bea7~vxJebKT_q0655806558epsmtrp2w;
 Tue, 17 May 2022 02:49:03 +0000 (GMT)
X-AuditID: b6c32a38-49fff70000002872-b9-62830d200207
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 6A.B9.08924.F1D03826; Tue, 17 May 2022 11:49:03 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220517024903epsmtip1a6182b19cfef90dec31167c7ae123ef6~vxJeOJQtF1395013950epsmtip1m;
 Tue, 17 May 2022 02:49:03 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] extcon: Add extcon-regulator driver
To: Zev Weiss <zev@bewilderbeest.net>, Mark Brown <broonie@kernel.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <bc6595c8-5f05-ac2c-63e0-f442f9ec83be@samsung.com>
Date: Tue, 17 May 2022 12:15:31 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <YoL0UGR+TiZojL9Y@hatter.bewilderbeest.net>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLJsWRmVeSWpSXmKPExsWy7bCmvq4Cb3OSQctkDoupD5+wWTw7qm3R
 vHg9m8W3Kx1MFpd3zWGzuN24gs3iVMsLFou7r/0srjy9wOLA6bHgtrfHjrtLGD12zrrL7rFp
 VSebx/65a9g9zs9YyOjRt2UVo8fnTXIBHFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaG
 uoaWFuZKCnmJuam2Si4+AbpumTlAxykplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1Jy
 CkwL9IoTc4tL89L18lJLrAwNDIxMgQoTsjP2rNAtOCRd8fV8I3MDY69YFyMnh4SAiUTXwz3s
 XYxcHEICOxglFu+4xAThfGKUmHK8jRWkSkjgM6PEuV0SXYwcYB2vFoRB1OxilDh6fi4zhPOe
 UaJl7XUmkAZhAXuJCYvXgtkiAm4SS15vBStiFpjOJLFz3k5mkASbgJbE/hc32EBsfgFFias/
 HjOC2LwCdhLbVnaCxVkEVCXaL05iB7FFBcIkTm5rgaoRlDg58wkLyEWcAhYSWz7qg4SZBcQl
 bj2ZzwRhy0tsfzsHbK+EwAEOiQeXd7NB/OwicfDfQihbWOLV8S3sELaUxOd3e9kgGpoZJRpe
 3GaEcHqA/nzWxwJRZSyxf+lkJpDNzAKaEut36UOEFSV2/p7LCLGZT+Ld1x5WSHDxSnS0CUGU
 KEtcfnCXCcKWlFjc3sk2gVFpFpJ3ZiH5YRaSH2YhLFvAyLKKUSy1oDg3PbXYsMAEHtnJ+bmb
 GMHpVstiB+Pctx/0DjEycTAeYpTgYFYS4TWoaEgS4k1JrKxKLcqPLyrNSS0+xGgKDOCJzFKi
 yfnAhJ9XEm9oYmlgYmZkbGJhaGaoJM7bO/V0opBAemJJanZqakFqEUwfEwenVANTQ/ev/2Z8
 DusmtVt/VH0+45xKttWpaZsmP1GWnHns/o/UJ0mihoVZzF+Sf3astbC4fDn+K7tSu/fMECOn
 939/e3BuPtfu4WIaZuy0OzEw11EyLuqytIjT8ZNeR6p/9MyMi0m83nmNy06h1rvZnEfnOu/i
 k1y7jTa6lH5yWbYsMk72wAKfiZG71qmXPpVIi8pvV0uU601j6G75dC46Rjso7jHvxLaIWX8v
 s97nzLMLUv/MxenzRnx30rPtLiEcT3u7lgnoX0rSTWFkLBW4FmjT/bPW2d5vg9d6nq8Mj2st
 jkZbvmD8zq97SrcinbVyS6VOiOgtof2T1bkc1ds3btr8iPvE+aP3vxf47L82R4mlOCPRUIu5
 qDgRAKzjGidABAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRmVeSWpSXmKPExsWy7bCSnK48b3OSwew3ahZTHz5hs3h2VNui
 efF6NotvVzqYLC7vmsNmcbtxBZvFqZYXLBZ3X/tZXHl6gcWB02PBbW+PHXeXMHrsnHWX3WPT
 qk42j/1z17B7nJ+xkNGjb8sqRo/Pm+QCOKK4bFJSczLLUov07RK4Mvas0C04JF3x9XwjcwNj
 r1gXIweHhICJxKsFYV2MnBxCAjsYJZ58MgGxJQQkJaZdPMoMUSIscfhwcRcjF1DJW0aJhXt7
 mEFqhAXsJSYsXssEYosIuEkseb2VGaSIWWA6k8TpT/eYIDoOM0ksunCKBaSKTUBLYv+LG2wg
 Nr+AosTVH48ZQWxeATuJbSs7weIsAqoS7RcnsYPYogJhEjuXPGaCqBGUODnzCQvIRZwCFhJb
 PuqDhJkF1CX+zLvEDGGLS9x6Mp8JwpaX2P52DvMERuFZSLpnIWmZhaRlFpKWBYwsqxglUwuK
 c9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxgqNOS2sH455VH/QOMTJxMB5ilOBgVhLhNahoSBLi
 TUmsrEotyo8vKs1JLT7EKM3BoiTOe6HrZLyQQHpiSWp2ampBahFMlomDU6qByXWJyo2jL3lv
 hs2+IvNuh8+s91qHKnr/BFs96n4bJr6tT3Qu4+PyI9s3F3uHRkU//zO/4KTkiXlrpVh12q9c
 Ms1U2/S7OfH3re3LQt1V//4RqO1I8K5Ui6qdtWffM7YTzVOPzfxxuj9fRGxa6tZdM07zC1u0
 tf37+1sywTZdQFG13uKaZMSRbd8ntMf7sh15/PKUU43l9yn7ORdl7GEsDFGxOMMtEdQW56LU
 3rHu8YM5pQ/E3+0+l3xaZn6jfeZW0U3nq/03/j8gGHpm63m5GWoKxSW23yzveysetu7f/Uxy
 WtcuXabFJlqf9683Da6J+792x9ueqIW/jAKi15SwHfTZ8ELNW1Ep9Dq38vxqEyWW4oxEQy3m
 ouJEAISIuwcpAwAA
X-CMS-MailID: 20220517024903epcas1p2e146717a160c3dfbe42a8fa97a7280af
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220517010322epcas1p45d7fdaa06d23f07533350b7d0cf9e9d6
References: <20220505232557.10936-1-zev@bewilderbeest.net>
 <20220505232557.10936-3-zev@bewilderbeest.net>
 <e27ff1b2-c82f-8335-340f-ae1fa914ed30@gmail.com>
 <YnkyIBh2HnXXLHw3@sirena.org.uk>
 <CGME20220517010322epcas1p45d7fdaa06d23f07533350b7d0cf9e9d6@epcas1p4.samsung.com>
 <YoL0UGR+TiZojL9Y@hatter.bewilderbeest.net>
X-Mailman-Approved-At: Tue, 17 May 2022 22:52:11 +1000
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chanwoo Choi <cwchoi00@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mark, Zev,

On 5/17/22 10:03 AM, Zev Weiss wrote:
> [Adding Sebastian for drivers/power discussion]
> 
> On Mon, May 09, 2022 at 08:24:16AM PDT, Mark Brown wrote:
>> On Mon, May 09, 2022 at 09:24:39PM +0900, Chanwoo Choi wrote:
>>> Hi Zev,
>>>
>>> I checked this patch. But, it doesn't look like the extcon provider
>>> driver. Because basically, extcon provider driver need the circuit
>>> in order to detect the kind of external connector. But, there are
>>> no any code for detection. Just add the specific sysfs attribute
>>> for only this driver. It is not standard interface.
>>
>> OTOH it's something where if I look at the physical system with the
>> hardware there's a clearly visible external connector that I can point
>> to - it just happens to not support hotplug.  It's not clear what other
>> system it would sit in, and it seems like an application that displays
>> external connections on a system in a UI would be able to do something
>> sensible with it.
> 
> Chanwoo, any further thoughts on Mark's reasoning above?
> 
> I certainly understand the reluctance to add an extcon driver that 
> doesn't really do anything with the extcon API, and I have no idea when 
> we might end up enhancing it to do something more meaningful with that 
> API (I don't know of any hardware at the moment that would need it).
> 
> That said, as Mark points out, the hardware *is* ultimately an "external 
> connector" (if a very simplistic one).
> 
> Do you have any other ideas for where this functionality could go?  Greg 
> wasn't enthusiastic about a previous revision that had it in 
> drivers/misc -- though now a fair amount of what was in that version is 
> now going to be in the regulator core, so maybe that could be 
> reconsidered?
> 
> Or maybe something under drivers/power, though it's not really a supply 
> or a reset device...drivers/power/output.c or something?
> 
> Personally I don't have any terribly strong opinions on this, I'd just 
> like to reach a mutually-agreeable consensus on a place for it to live.
> 

After Mark's reply, I considered extcon provider driver without hotplug
feature. I think that extcon need to support the following something:

1. Need to specify the type of external connector instead of EXTCON_NONE.
2. extcon subsystem provides the standard sysfs interface
   for non-hotplug extcon provider driver.
3. User can control the state of external connector via
   the standard extcon sysfs attributes.


For example of extcon provider driver,
static const unsigned int supported_cables[] = {
	EXTCON_USB,
	EXTCON_NONE,
};

int extcon_usb_callback(int connector_id, int property_id, int state, void *data) {
	struct extcon_dev *edev = data;

	if (id == EXTCON_USB && property_id == EXTCON_NOT_HOTPLUG) {
		regulator_enable() or regulator_disable()
	}

	return 0;
}

int extcon_provider_probe(...) {
	edev = devm_extcon_dev_allocate(dev, supported_cables);

	devm_extcon_dev_register(dev, edev);

	extcon_set_property_capability(edev, EXTCON_USB, EXTCON_NOT_HOTPLUG);
	extcon_set_property_callback(edev, EXTCON_USB, extcon_usb_callback);

	...
}

And then user can change the state of each external connector
via '/sys/class/extcon/extcon0/cable.0/state' 
if cable.0 contains the EXTCON_NOT_HOTPLUG property.

I'm designing this approach. But it has not yet decided
because try to check that this approach is right or not.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
