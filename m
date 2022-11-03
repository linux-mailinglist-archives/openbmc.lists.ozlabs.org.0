Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7628E617771
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 08:16:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2w6m2VBHz3c2j
	for <lists+openbmc@lfdr.de>; Thu,  3 Nov 2022 18:16:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=FbcvFApo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=203.254.224.24; helo=mailout1.samsung.com; envelope-from=gt82.lee@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=FbcvFApo;
	dkim-atps=neutral
X-Greylist: delayed 405 seconds by postgrey-1.36 at boromir; Thu, 03 Nov 2022 18:16:17 AEDT
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2w696d54z2xCj
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 18:16:12 +1100 (AEDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20221103070917epoutp0173079484c5ed645069970e56166e67bb~kAXOF9pyf3212132121epoutp01C
	for <openbmc@lists.ozlabs.org>; Thu,  3 Nov 2022 07:09:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20221103070917epoutp0173079484c5ed645069970e56166e67bb~kAXOF9pyf3212132121epoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1667459357;
	bh=5pt8EyTPbfFtRMUAsmGLcFniip//ZpkONvXQehb3XGk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=FbcvFApol5n3TPcIHJ0r3AaRuIEifD8Dlmk0AUdfnIBPFk7D8RosWRSjF8z2/pbV4
	 XuXMT+nr1XCP8Y+5Q+aFgcKkb3Rn7A78AW0A1yLsYfRzpKsixIu4W7uDxDR796nmfY
	 UISF5y4hGwhhLPJm+gaT8EomXpFL7xNSnZu7EsQA=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20221103070917epcas2p40d1f559b4dc77de0dd6858b1dc14bd45~kAXNrGZUF0427804278epcas2p4U;
	Thu,  3 Nov 2022 07:09:17 +0000 (GMT)
Received: from epsmges2p3.samsung.com (unknown [182.195.36.97]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4N2vy45VLTz4x9QB; Thu,  3 Nov
	2022 07:09:16 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p3.samsung.com (Symantec Messaging Gateway) with SMTP id
	F3.74.08487.C1963636; Thu,  3 Nov 2022 16:09:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20221103070916epcas2p40d1ad61e3a132a4b07fb154b281a8286~kAXM0qx230351103511epcas2p4V;
	Thu,  3 Nov 2022 07:09:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20221103070916epsmtrp201236ef7f158f2c2e2796f964fc4c261~kAXMz5uFr1594815948epsmtrp2u;
	Thu,  3 Nov 2022 07:09:16 +0000 (GMT)
X-AuditID: b6c32a47-873ff70000002127-f9-6363691c290c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	10.0D.14392.C1963636; Thu,  3 Nov 2022 16:09:16 +0900 (KST)
Received: from KORDO025540 (unknown [12.36.79.186]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20221103070916epsmtip2050e080788b32851609fa0e67e6b3c76~kAXMrv8qB1996919969epsmtip25;
	Thu,  3 Nov 2022 07:09:16 +0000 (GMT)
From: "Gyeongtaek Lee" <gt82.lee@samsung.com>
To: <openbmc@lists.ozlabs.org>
Subject: Porting a device using MCTP over SMBUS
Date: Thu, 3 Nov 2022 16:09:16 +0900
Message-ID: <000001d8ef53$2f4b7cf0$8de276d0$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdjvP0qO5IoIh72ASrutUugAvIkSZQ==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJKsWRmVeSWpSXmKPExsWy7bCmua5MZnKyQUe/rsXR4xNZLDbP3sNq
	sa99P5PFjYflFqdaXrA4sHqcn7GQ0aNvyyrGAKaobJuM1MSU1CKF1Lzk/JTMvHRbJe/geOd4
	UzMDQ11DSwtzJYW8xNxUWyUXnwBdt8wcoG1KCmWJOaVAoYDE4mIlfTubovzSklSFjPziElul
	1IKUnALzAr3ixNzi0rx0vbzUEitDAwMjU6DChOyM2UcOshRc5ah4dvMeUwPjO7YuRk4OCQET
	ibcnnjF3MXJxCAnsYJRY/68ZyvnEKHH5xDUmCOcbo8She33MMC3Pj7cwgdhCAnsZJR6dioCw
	XwAVLZQEsdkEdCW+3LsDVi8iICdx9fpP1i5GDg5mgWyJvmawsLCAvsTGrw/YQWwWARWJ7d1v
	wS7iFbCUaH54nx3CFpQ4OfMJC4jNLCAvsf3tHKgTFCR+Pl3GCjFeT6Lj3QVmiBoRidmdbWAP
	SAhcY5fobmlnA9krIeAisXJyDESvsMSr41vYIWwpic/v9kJDolhi8tdHUPEeRolns8IgbGOJ
	40uesEGcrymxfpc+xERliSO3oC7jk+g4/JcdIswr0dEmBNGoJLHx1D8miLCExLwNULM9JN7M
	/8IygVFxFpIXZyF5cRaSV2YhrF3AyLKKUSy1oDg3PbXYqMAYHs/J+bmbGMFpUMt9B+OMtx/0
	DjEycTAeYpTgYFYS4a0/G50sxJuSWFmVWpQfX1Sak1p8iNEUGOgTmaVEk/OBiTivJN7QxNLA
	xMzM0NzI1MBcSZy3a4ZWspBAemJJanZqakFqEUwfEwenVANTztH2zI3GnHMKNnd5a56qO90+
	86/8s4Y9dhzK3z789c9TcDiS4HO6QXHGlyMuyUzzGZYt1r51YfFG5iX3T92sq33LtCvy1qPt
	pxdKHfxWqzfhqIxqX/+N9sJq/hUBe2fNOn785sb3PqqybpylV7MlizKeWl9N7z87aUFBURKH
	3q6nv7Yl71ATn/5yj+lH9rXF/5xF/5Zde7l40kG5f1LSFxynv/q/OSKz37C/oPL1r96HHde6
	l3e1x2ycNftDyVGXk2o9ux9t1JQw4jXlrv7IVVJ89U6MwsXLkzqdLr+e47n5ydavh4K9Pve5
	iM0WzFr5vjddUSv4eMOr9LO2VTIRoaGbQvel3/FhWGd2jq/VS4mlOCPRUIu5qDgRAJ15GhYM
	BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsWy7bCSvK5MZnKyQc8jQYujxyeyWGyevYfV
	Yl/7fiaLGw/LLU61vGBxYPU4P2Mho0ffllWMAUxRXDYpqTmZZalF+nYJXBmzjxxkKbjKUfHs
	5j2mBsZ3bF2MnBwSAiYSz4+3MHUxcnEICexmlHj+eSIjREJC4sP8M+wQtrDE/ZYjrBBFz4CK
	3u1iAkmwCehKfLl3hxnEFhGQk7h6/ScriM0skC/xb98PsGZhAX2JjV8fgNksAioS27vfgm3m
	FbCUaH54nx3CFpQ4OfMJSxcjB1CvnkTbRkaIMfIS29/OYYa4QUHi59NlrBCr9CQ63l1ghqgR
	kZjd2cY8gVFwFpJJsxAmzUIyaRaSjgWMLKsYJVMLinPTc4sNCwzzUsv1ihNzi0vz0vWS83M3
	MYIDXUtzB+P2VR/0DjEycTAeYpTgYFYS4a0/G50sxJuSWFmVWpQfX1Sak1p8iFGag0VJnPdC
	18l4IYH0xJLU7NTUgtQimCwTB6dUA1PwW83i/fZ2r/1KfBMk0lKc1S1zr0yIWXdHalrz5g0X
	Hkb58WTr96jzNfz40fXh+7L78y5kMT9f/0azdevlzTEvGqXn5TbZGu1pk8m+YtIyj7uEVTi+
	iPkH64vdzTrsJ9unb/tmrT/bcvKSrXOd9WvVtBQXT3u67sJ9ubXRW9fvyJ/Ikm16nXGime08
	uZNn2+6rSKf+fci/M2RikkNxpl5dWavCxgW5PVf45E7t3FsYu0KZq3it32N7xfVLjihq33BY
	vWGihVSMpZal+MInm4VWK3X4dczyELR0y5i2v+Yzz7lia7eZC/7r6q30mPP49IKpHr+Lwh5a
	zpg460+GzeaNB2OnrpKaFDd9noTl0hglluKMREMt5qLiRACm8Vxh4wIAAA==
X-CMS-MailID: 20221103070916epcas2p40d1ad61e3a132a4b07fb154b281a8286
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221103070916epcas2p40d1ad61e3a132a4b07fb154b281a8286
References: <CGME20221103070916epcas2p40d1ad61e3a132a4b07fb154b281a8286@epcas2p4.samsung.com>
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

Hi Team,

I had a couple of questions on implementing a service that communicate with a device using MCTP over SMBUS.
It would be appreciated if anyone give me some clarification.

In my observation, there is already libmctp package which is an implementation of  MCTP.
However, libmctp doesn't have a binding for SMBUS.
By the way, Intel-BMC has mctpd and modified libmctp package for MCTP over SMBUS but it is different from the upstream of OpenBMC
project.

So my questions are,
1. what is a right approach to implement a service to communicate with a device using MCTP over SMBUS?
  (1) Implement my own SMBUS binding on the libmctp of OpenBmc project and use it
  (2) Import mctpd and libmctp of Intel-BMC and use it
  (3) Some other approach that I don't know about?

2. If I use the packages of Intel-BMC, is it possible to contribute the service to OpenBMC?
    I think that dependency to outside of the project may cause a problem on the CI.

Actually, I'm not very familiar with OpenBMC.
So, please let me know, if there is any misunderstanding.

Thank you,
Gyeongtaek Lee

