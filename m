Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69BE63191D
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 05:16:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFvFx36htz3cLX
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 15:16:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=S4fRDTWN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.33; helo=mailout3.samsung.com; envelope-from=gt82.lee@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=S4fRDTWN;
	dkim-atps=neutral
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFvFH0RLYz2yph
	for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2022 15:15:25 +1100 (AEDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20221121041513epoutp0382322d931d00c69f5a5b66a5a5df3bae~pfmYSYNHw2844028440epoutp03A
	for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2022 04:15:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20221121041513epoutp0382322d931d00c69f5a5b66a5a5df3bae~pfmYSYNHw2844028440epoutp03A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1669004113;
	bh=5MRO8ZVvYkUl9cQjF2qHR69fmlNXEASAtTDE/s1KR9M=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=S4fRDTWNinJPYxakthLluYNE/cUSaUtJHJagRJLemYA3UWQk7+phoOqHkXRksxjfC
	 nNccIBOdC737RpRFV5bPAvywA+XBsa/wbiVji80ltZ56fJ8wD4dKON1wZpY0KyzWq/
	 enlUwk6mlQYq326GEDEnQzY1Zi2aKL3j0qJGGmqo=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20221121041513epcas2p4348cf0fc6dd1e9ee5990c406d0062335~pfmX9UPhD2800128001epcas2p4o;
	Mon, 21 Nov 2022 04:15:13 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.102]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 4NFvDw6QD1z4x9QD; Mon, 21 Nov
	2022 04:15:12 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	88.6E.12278.05BFA736; Mon, 21 Nov 2022 13:15:12 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20221121041512epcas2p3665f584535dd9441848201ea9f1683ec~pfmXEE7TS2522625226epcas2p3P;
	Mon, 21 Nov 2022 04:15:12 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20221121041512epsmtrp104ff58ff0a47bf1ae64506ff043ecf36~pfmXDbSka1813118131epsmtrp1S;
	Mon, 21 Nov 2022 04:15:12 +0000 (GMT)
X-AuditID: b6c32a46-85fff70000012ff6-44-637afb503b06
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	EA.B7.18644.05BFA736; Mon, 21 Nov 2022 13:15:12 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.79.186]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20221121041512epsmtip1a16386b48b37de99a0782ddb7f186a3e~pfmW5oHZA0144901449epsmtip1a;
	Mon, 21 Nov 2022 04:15:12 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: "'Jeremy Kerr'" <jk@codeconstruct.com.au>, <openbmc@lists.ozlabs.org>
In-Reply-To: <da6363c6ae07bd283c4259cf73d5a8c7968e2e91.camel@codeconstruct.com.au>
Subject: RE: Porting a device using MCTP over SMBUS
Date: Mon, 21 Nov 2022 13:15:12 +0900
Message-ID: <002f01d8fd5f$d9ad8de0$8d08a9a0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJM8PITdGZpnfuteFfcvOL47c9PZwMFgTUnApp6kAGtM8ZMwA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmk+LIzCtJLcpLzFFi42LZdljTTDfgd1WywfcmHYujxyeyWGyevYfV
	4vq8BnaLfe37mSxuPCy3ONXygsWBzePKvjVMHudnLGT06NuyijGAOSrbJiM1MSW1SCE1Lzk/
	JTMv3VbJOzjeOd7UzMBQ19DSwlxJIS8xN9VWycUnQNctMwdor5JCWWJOKVAoILG4WEnfzqYo
	v7QkVSEjv7jEVim1ICWnwLxArzgxt7g0L10vL7XEytDAwMgUqDAhO+NB6zrmgjl8FTPXb2Jp
	YDzA08XIwSEhYCKxrzWli5GLQ0hgB6PEwdlb2SGcT4wSq+esZYRwPjNKvFgyhw2mo2NFCER8
	F6PEu+9XoTpeMEp8vfCetYuRk4NNQFfiy707zCC2iICnxK2Tt8BsZoFsiSkXJzCB2JwCQRK7
	5rxmB7GFBYwlJsy6yAqygEVAVeLpCw4Qk1fAUuLCU02QCl4BQYmTM5+wQEzRlli28DXYRAkB
	BYmfT5exQmxykljyZS0bRI2IxOzONmaQ0yQEWjkk1jedZIRocJG49mI1lC0s8er4FnYIW0ri
	ZX8blF0sMfnrIyi7h1Hi2awwCNtY4viSJ+BwYBbQlFi/Sx8SJMoSR25BncYn0XH4LztEmFei
	o00IolFJYuOpf0wQYQmJeRvYJzAqzULy1ywkf81Ccv8shFULGFlWMYqlFhTnpqcWGxUYweM5
	OT93EyM4NWq57WCc8vaD3iFGJg7GQ4wSHMxKIrwixyqThXhTEiurUovy44tKc1KLDzGaAsN5
	IrOUaHI+MDnnlcQbmlgamJiZGZobmRqYK4nzds3QShYSSE8sSc1OTS1ILYLpY+LglGpgkj3A
	bt0j8PRZXcPGgx6TVi74bHP2fQcDa+3fghufI5M+z5XzCOjoSw75nj+V25sjd1XClvbbV+/O
	d17yYetu4/37MjfyXJrxdqPNXnbJmxXL+bd+bNj3/vPDXXG/udKv1J7YF9KiJFaSGjlF18NO
	9tbhiwct/8w1fLtDy+mM9bfXJ00ebpQ+aDzf6tD5O+uV3l79zv9JlX3TtG6TVVoL52qctlv7
	b5Z72du/VsyS21m9bf+dLlbyD7m9YWPADTuG3ZMeS0o1Cp6eFru0evvx9XHr/q2WF6/x2K2U
	qbohTkCxl6PgXm2CeUJp/pGdlz+vFu5se78oO+8vQ95P6/6K7Ik+f2Namh9UJK08lR734qwS
	S3FGoqEWc1FxIgD2eLm5FgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRmVeSWpSXmKPExsWy7bCSnG7A76pkg4vzxS2OHp/IYrF59h5W
	i+vzGtgt9rXvZ7K48bDc4lTLCxYHNo8r+9YweZyfsZDRo2/LKsYA5igum5TUnMyy1CJ9uwSu
	jPYHTcwFK/gqNl9vZWtgPMLTxcjBISFgItGxIqSLkYtDSGAHo8SkTxtYuhg5geISEh/mn2GH
	sIUl7rccYYUoesYo8ejMI2aQBJuArsSXe3eYQQaJCHhL3DvqBWIyC+RLXPyXBFF+kVFi36sr
	TCDlnAJBErvmvAabKSxgLDFh1kVWkHoWAVWJpy84QExeAUuJC081QSp4BQQlTs58AnYNs4C2
	RO/DVkYYe9nC18wQlylI/Hy6jBXEFhFwkljyZS0bRI2IxOzONuYJjMKzkIyahWTULCSjZiFp
	WcDIsopRMrWgODc9t9iwwCgvtVyvODG3uDQvXS85P3cTIzhStLR2MO5Z9UHvECMTB+MhRgkO
	ZiURXpFjlclCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeS90nYwXEkhPLEnNTk0tSC2CyTJxcEo1
	MFk/+36GRzXy1rQ5619mViYIiR9o3bwyM/lzf+KlH8azz7MypTg2qN4/n1u4xLHrzmG7m24r
	Nvczmu0rElZhOHFbsGDiPl3OK307HI2Stfd+f/L+bd6e/RxP9DZttX+SkLI7Q3fHhQPmp49s
	mNiv9bXaR5dPoUlk3q7pU3I31DIXbumwOCef9eztWb7g1wyVbaJxb9aqsU5M9/tZoSl5c9e9
	Z+1Xpsbmz6m4Fn4sddox34JjYjuPRrXNv37D+1H7vBe7Zi069WHa+Y9pnavP/792kPH9rspj
	zHtu6/19nh/RH7bOW/qh/5YtupySR39Vh0w/ddVU2IDVwO+X/QrGByLuEsfXxeoeLnzSKGL1
	Rfe5EktxRqKhFnNRcSIA38krwQMDAAA=
X-CMS-MailID: 20221121041512epcas2p3665f584535dd9441848201ea9f1683ec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221103070916epcas2p40d1ad61e3a132a4b07fb154b281a8286
References: <CGME20221103070916epcas2p40d1ad61e3a132a4b07fb154b281a8286@epcas2p4.samsung.com>
	<000001d8ef53$2f4b7cf0$8de276d0$@samsung.com>
	<da6363c6ae07bd283c4259cf73d5a8c7968e2e91.camel@codeconstruct.com.au>
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
Cc: jaeheon.ma@samsung.com, jungsoo0.kim@samsung.com, bj20.kim@samsung.com, kavin.lee@samsung.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

>Hi Gyeongtaek,
>
>> I had a couple of questions on implementing a service that
>> communicate with a device using MCTP over SMBUS.
>>
>> It would be appreciated if anyone give me some clarification.
>>=20
>> In my observation, there is already libmctp package which is an
>> implementation of  MCTP.
>> However, libmctp doesn't have a binding for SMBUS.
>
>We're moving to an in-kernel MCTP stack, rather than using libmctp in
>the OpenBMC system. With the kernel stack, there is a MCTP-over-SMBus
>driver available.
>
>I have some background information on the kernel MCTP support here:
>
>  https://protect2.fireeye.com/v1/url?k=3D51f68813-308d229a-51f7035c-74fe4=
8600034-d596f3730404663c&q=3D1&e=3D2c9eac34-895b-4d5b-a7d2-b0048aaf6cc6&u=
=3Dhttps%3A%2F%2Fcodeconstruct.com.au%2Fdocs%2Fmctp-on-linux-introduction%2=
F
>
>For some background on the OpenBMC-specific uses of the MCTP stack, we
>have this:
>
>  https://protect2.fireeye.com/v1/url?k=3Dcbab0b9a-aad0a113-cbaa80d5-74fe4=
8600034-347fb9fe6e33ec51&q=3D1&e=3D2c9eac34-895b-4d5b-a7d2-b0048aaf6cc6&u=
=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fdocs%2Fblob%2Fmaster%2Fdesigns%2Fmc=
tp%2Fmctp.md
>
>and, in case you're looking at NVMe-MI support:
>
>  https://protect2.fireeye.com/v1/url?k=3D8897634f-e9ecc9c6-8896e800-74fe4=
8600034-3b7e630546ea9424&q=3D1&e=3D2c9eac34-895b-4d5b-a7d2-b0048aaf6cc6&u=
=3Dhttps%3A%2F%2Fcodeconstruct.com.au%2Fdocs%2Fnvme-mi-with-libnvme%2F
>  https://protect2.fireeye.com/v1/url?k=3D2dc12adb-4cba8052-2dc0a194-74fe4=
8600034-f05d0d8d663fc6d9&q=3D1&e=3D2c9eac34-895b-4d5b-a7d2-b0048aaf6cc6&u=
=3Dhttps%3A%2F%2Fcodeconstruct.com.au%2Fdocs%2Fnvme-mi-firmware-update%2F

Hi Jeremy,

Thank you for your kind suggestion.
I'll look at the driver and the document.

Sincerely,
Gyeongtaek Lee

