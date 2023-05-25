Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7D710266
	for <lists+openbmc@lfdr.de>; Thu, 25 May 2023 03:36:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRVyt1Fhmz30Jy
	for <lists+openbmc@lfdr.de>; Thu, 25 May 2023 11:36:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Mod/cgBz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.25; helo=mailout2.samsung.com; envelope-from=gt82.lee@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Mod/cgBz;
	dkim-atps=neutral
X-Greylist: delayed 324 seconds by postgrey-1.36 at boromir; Thu, 25 May 2023 11:36:22 AEST
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRVyG46zvz2xBF
	for <openbmc@lists.ozlabs.org>; Thu, 25 May 2023 11:36:18 +1000 (AEST)
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20230525013046epoutp02b1653af0b5bd23326c8dc57a0e2fd956~iPsmu-vu11491714917epoutp02N
	for <openbmc@lists.ozlabs.org>; Thu, 25 May 2023 01:30:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20230525013046epoutp02b1653af0b5bd23326c8dc57a0e2fd956~iPsmu-vu11491714917epoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1684978246;
	bh=JF2uXdhs0CWMjWk1Kib9XH4ukz7jBVBI9lw+7uv6IaM=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Mod/cgBzs/JEdIkY6aKo1OqDPxr6H5CAnHI4q22CM0Cosm1mZ8hE9GRgpthU/RxPh
	 0TIaR8sJL4fDrxbcmQQSCwH6qI0n5P9knI2OmRCdIA1s/syGub1KHRSqlh4ilP8AVl
	 V04SMMcXr7+JbcebPbWe5NxwRTWnVnAekxvhXxT0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20230525013046epcas2p4f97c161f10aedd9ccc64f631218af48f~iPsmWw3Ev1851818518epcas2p4P;
	Thu, 25 May 2023 01:30:46 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.99]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4QRVqn2pvlz4x9QJ; Thu, 25 May
	2023 01:30:45 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	C8.44.17293.54ABE646; Thu, 25 May 2023 10:30:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20230525013044epcas2p28c712f1a679c4a33e08fa54077dd1adf~iPslDwFRn1746117461epcas2p2C;
	Thu, 25 May 2023 01:30:44 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20230525013044epsmtrp110d5ca7b319bb79acf0d082fa28689f1~iPslDITU22469424694epsmtrp1U;
	Thu, 25 May 2023 01:30:44 +0000 (GMT)
X-AuditID: b6c32a46-8b7ff7000001438d-07-646eba452481
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	07.5A.28392.44ABE646; Thu, 25 May 2023 10:30:44 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.58.119]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20230525013044epsmtip29f00eba7ed639525adc5a6e6257ffe23~iPsk1-HNt2912129121epsmtip21;
	Thu, 25 May 2023 01:30:44 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: <openbmc@lists.ozlabs.org>
Subject: MCTP over PCIe VDM in Intel Eagle Stream Archer City
Date: Thu, 25 May 2023 10:30:44 +0900
Message-ID: <000001d98ea8$86708030$93518090$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdmOlePZRPMc3tijQby4oKIOdznvQw==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLKsWRmVeSWpSXmKPExsWy7bCmua7rrrwUgwcrBS3mvjvMZrF59h5W
	i33t+5ksnu3axGZxquUFiwOrx/kZCxk9+rasYgxgisq2yUhNTEktUkjNS85PycxLt1XyDo53
	jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAFap6RQlphTChQKSCwuVtK3synKLy1JVcjILy6x
	VUotSMkpMC/QK07MLS7NS9fLSy2xMjQwMDIFKkzIzrje+4ix4KBMxbr9V5kaGN+IdTFyckgI
	mEjsfL6evYuRi0NIYAejxIH3bxghnE+MEq/nLGWGcD4zStw/MoURpmXB4wYWiMQuRon/jXOh
	ql4wSiyac4gZpIpNQFfiy707YLaIgJzE1es/WUFsZoF6idm329i6GDk4hAVsJT7tEgQJswio
	SnSvXQRWzitgKfH+x0M2CFtQ4uTMJywQrfIS29/OYYY4QkHi59NlrBDj9SSmXl4EVSMiMbuz
	DeweCYF77BJ/Pt1jh2hwkZj4rJ8NwhaWeHV8C1RcSuJlfxuUXSwx+esjKLuHUeLZrDAI21ji
	+JInYDczC2hKrN+lD2JKCChLHLkFtZZPouPwX3aIMK9ER5sQRKOSxMZT/5ggwhIS8zZAzfaQ
	+Px9BusERsVZSH6cheTHWUh+mYWwdgEjyypGsdSC4tz01GKjAiN4VCfn525iBKdDLbcdjFPe
	ftA7xMjEwXiIUYKDWUmE90R5dooQb0piZVVqUX58UWlOavEhRlNgqE9klhJNzgcm5LySeEMT
	SwMTMzNDcyNTA3MlcV5p25PJQgLpiSWp2ampBalFMH1MHJxSDUw19U1XvcWsCxr4Ht8Wn1L9
	zXtOyOFrR4RcU1d1zE95+k/n8c4Ux/reEz6lpyfv4uC1nuFRnW/TdkXI6UXCs5LpRov7b9Z/
	fLd4pkx3unpaddHfviV2i684vN7IJuA99WyukG4NS03eoo7HgWaZu+Veu7Ovurt7cZ9I6//o
	KyJay5pjf8qHccjy2ShIlb/xjnFKZBYOXnqEUd3Mxjd4/ewLy6u+dJhv2MQbf7O1b6GmZ+Rc
	rfkzrASXrb1XuGzlqj6G3oQCRbWquMav6wJ3XLItmb760uIpZTdMNx9gXWLAwWvgkcnKa3BF
	5qWKkv2r2tDdb4wVjRj0dtw+MSngxQ4JRvX1sRqM8gKTb5wpUGIpzkg01GIuKk4EAL+1u0wQ
	BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSvK7LrrwUg56HKhZz3x1ms9g8ew+r
	xb72/UwWz3ZtYrM41fKCxYHV4/yMhYwefVtWMQYwRXHZpKTmZJalFunbJXBlXO99xFhwUKZi
	3f6rTA2Mb8S6GDk5JARMJBY8bmDpYuTiEBLYwShx+PthNoiEhMSH+WfYIWxhifstR1ghip4x
	Srz/eJ4ZJMEmoCvx5d4dMFtEQE7i6vWfYEXMAs2MEk/6jgI5HBzCArYSn3YJgtSwCKhKdK9d
	BFbPK2Ap8f7HQzYIW1Di5MwnLCDlzAJ6Em0bGUHCzALyEtvfzmGGuEFB4ufTZawQq/Qkpl5e
	xAJRIyIxu7ONeQKj4Cwkk2YhTJqFZNIsJB0LGFlWMUqmFhTnpucWGxYY5aWW6xUn5haX5qXr
	JefnbmIEh7qW1g7GPas+6B1iZOJgPMQowcGsJMJ7ojw7RYg3JbGyKrUoP76oNCe1+BCjNAeL
	kjjvha6T8UIC6YklqdmpqQWpRTBZJg5OqQamUpE8A0k57sUHTIN+ZTr1ui6ozF3codvR9+x8
	XR7T7P9PpzxZ5Gl07/mvbHfDoMlLym7d2Vd/f5Lc8k3Km69v3lqn93PS9/VrTDWObz4/a4PD
	DROJqdvPr2Jadr3qcmLYjFvlon4sl1e/1L4bdn1plmjcv9P1G6/c1wmfofzZoX5bTKDZsb8G
	pzUnBgj5u3zQmlvt8OI3V3Gg2OkEgRtTmKf1nPPT39LA36hX/3O7dlPa4x3Zdzfu0csRXCp+
	M6diy+J9sxWu8F26H/zg/8clHBbHCrdm3Xc7zxwverP9uZyZzretL4vCrv35psGydO7MxCVd
	rYcLyndZ2Cscar/geXHyHhnZzBtviizCd+99slGJpTgj0VCLuag4EQDcIlqV5AIAAA==
X-CMS-MailID: 20230525013044epcas2p28c712f1a679c4a33e08fa54077dd1adf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230525013044epcas2p28c712f1a679c4a33e08fa54077dd1adf
References: <CGME20230525013044epcas2p28c712f1a679c4a33e08fa54077dd1adf@epcas2p2.samsung.com>
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
Cc: manhee.jang@samsung.com, jaeheon.ma@samsung.com, 'Jungsoo	Kim' <jungsoo0.kim@samsung.com>, chihun.won@samsung.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello All,

I'm not sure about whether this is the right place to ask a question about some specific platform.
If anyone think that I should ask in some other place, just let me know.

I'm trying to porting some services from Intel-BMC organization including nvmemi-daemon and mctpd 
for Eagle Stream Archer City Reference Platform, to communicate with storage devices in the backplane through out-of-band.
Since I studied the platform, SMBUS from the backplane is connected to the BMC though the PCH,
using PCH as a bridge which is transforming MCTP over SMBUS to-from MCTP over PCIe VDM.

   AST2600 <==MCTP over PCIe VDM==> PCH and FPGA <==MCTP over SMBUS==> HSBP

Communication worked well with a short NVMe-MI command.
However, if I send a MCTP message longer than 64bytes, there is no response.

May 23 06:28:07 archercity mctpd-AC_Baseboard_2fMCTP_PCIe[480]: core: Generating packets for transmission of 72 byte message from 10
to 9
May 23 06:28:07 archercity mctpd-AC_Baseboard_2fMCTP_PCIe[480]: core: Enqueued 2 packets
May 23 06:28:07 archercity mctpd-AC_Baseboard_2fMCTP_PCIe[480]: astpcie: TX, len: 16, pad: 0
May 23 06:28:07 archercity mctpd-AC_Baseboard_2fMCTP_PCIe[480]: astpcie: >TX> 72 00 10 10 02 00 00 7F 49 00 1A B4 01 09 0A 88 84 10
00 00 0A 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
May 23 06:28:07 archercity mctpd-AC_Baseboard_2fMCTP_PCIe[480]: astpcie: TX, len: 2, pad: 0
May 23 06:28:07 archercity mctpd-AC_Baseboard_2fMCTP_PCIe[480]: astpcie: >TX> 72 00 10 02 02 00 00 7F 49 00 1A B4 01 09 0A 58 00 00
00 00 D7 41 4A 4A
May 23 06:28:07 archercity nvme-mi[301]: getAdminGetFeaturesCQDWord0 request 0x84 0x10 0x00 0x00 0x0a 0x00 0x00 0x00 0x00 0x00 0x00
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x02 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
0x00 0x00 0x00 0x00 0x00 0xd7 0x41 0x4a 0x4a

At first, I thought that split MCTP packet might be a problem.
So, I changed the MTU size to 128 byte and 256 byte by fixing MTU size defines in libmctp-intel and aspeed-mctp driver in
linux-aspeed.
But I couldn't get response neither.

May 24 08:22:00 archercity nvme-mi[299]: getAdminGetFeaturesCQDWord0 request 0x84 0x10 0x00 0x00 0x0a 0x00 0x00 0x00 0x00 0x00 0x00
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x02 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
0x00 0x00 0x00 0x00 0x00 0xd7 0x41 0x4a 0x4a
May 24 08:22:00 archercity mctpd-AC_Baseboard_2fMCTP_PCIe[515]: core: Generating packets for transmission of 72 byte message from 10
to 9
May 24 08:22:00 archercity mctpd-AC_Baseboard_2fMCTP_PCIe[515]: core: Enqueued 1 packets
May 24 08:22:00 archercity mctpd-AC_Baseboard_2fMCTP_PCIe[515]: astpcie: TX, len: 18, pad: 0
May 24 08:22:00 archercity mctpd-AC_Baseboard_2fMCTP_PCIe[515]: astpcie: >TX> 72 00 10 12 02 00 00 7F 49 00 1A B4 01 09 0A C8 84 10
00 00 0A 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 D7 41 4A 4A

So, I stuck here.
If there is anyone that can share any information or hint to debug it, it would be really appreciated.

Regards,
Gt Lee

