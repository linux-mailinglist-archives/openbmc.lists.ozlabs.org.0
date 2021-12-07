Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 829FC46B56C
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 09:12:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7Y1s2MX2z2yPN
	for <lists+openbmc@lfdr.de>; Tue,  7 Dec 2021 19:12:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DTNdPiwl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DTNdPiwl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7Y1M0sYkz2xXs
 for <openbmc@lists.ozlabs.org>; Tue,  7 Dec 2021 19:12:06 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B77lpH7027926; 
 Tue, 7 Dec 2021 08:12:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=e3i33fvRShRQ8hY+plFklJnA1FZzrtnngpYW8P/UTBM=;
 b=DTNdPiwlYZyBHJQAAmodrpviD8HMTZkRnq217cVJVlUaUA0uQmfXN5mp7WdpQL+M3MkF
 uctxfXXm3me0GWq1VEWMV+cQpUZeptP0VETxAR6KHt1M34c5IZcY0CDarnfBAtLttpKI
 JaQhgfejv63kbzdry2tqN2aMN0eZcpLjGAdMtZH6oHFIY9Zy6YSkcOydFzym8jjfafNI
 l+Nda6m194Gvx3W/rt8+IWNAcfRA32gKZDUuf3V9yY18UioWpgsQ9Qohuiv9VLr5db85
 zry3LWK4iONmNvauMs8D4KnTzkQSJe2l/7vPzVal0GcZTOE+bjs7w3yhvAwhwCWGiltH RQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ct3hs0esg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 08:12:01 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B787mou025040;
 Tue, 7 Dec 2021 08:12:00 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 3cqyyajp2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 08:12:00 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B78BxPg54526264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 08:11:59 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9ABB7C6059;
 Tue,  7 Dec 2021 08:11:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 863D3C6069;
 Tue,  7 Dec 2021 08:11:59 +0000 (GMT)
Received: from mww0332.dal12m.mail.ibm.com (unknown [9.208.69.80])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  7 Dec 2021 08:11:59 +0000 (GMT)
In-Reply-To: <CACPK8Xcpg+V7BB6vq8oqqu=g7FRoTLLmz7-4G5Cp=hn0ziEuyw@mail.gmail.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Joel Stanley" <joel@jms.id.au>
Date: Tue, 7 Dec 2021 08:11:57 +0000
Message-ID: <OF32EA8A79.571186E8-ON002587A4.002D0A6E-002587A4.002D0A73@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8Xcpg+V7BB6vq8oqqu=g7FRoTLLmz7-4G5Cp=hn0ziEuyw@mail.gmail.com>,
 <20211119120057.12118-1-a.kartashev@yadro.com>
 <20211119120057.12118-3-a.kartashev@yadro.com>
 <FA1B4FAF-387D-4D71-952A-D44B493FC67B@gmail.com>
 <368313b889cbadc267b053cd808b080e9f6470a0.camel@yadro.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF125   November 22, 2021
X-MIMETrack: Serialize by http on MWW0332/03/M/IBM at 12/07/2021 08:11:58,
 Serialize complete at 12/07/2021 08:11:58
X-Disclaimed: 62399
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gY7fALezt1YQBqwtREv4W_IRlJjGfL4t
X-Proofpoint-GUID: gY7fALezt1YQBqwtREv4W_IRlJjGfL4t
Subject: RE: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for YADRO VEGMAN
 BMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_03,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0 clxscore=1011
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112070047
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
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree <devicetree@vger.kernel.org>,
 OpenBMC
 Maillist <openbmc@lists.ozlabs.org>, Andrei Kartashev <a.kartashev@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Monday, December 6, 2021, Joel Stanley wrote:

>On Sat, 20 Nov 2021 at 15:51, Andrei Kartashev
><a.kartashev@yadro.com> wrote:
>>
>> >
>> > Can we utilize
>> >
[ gpio naming ]
>> > to get some consistent naming across the GPIO=E2=80=99s on OpenBMC
>machines?
>> >
>>
>> Some names here are standard for Intel daemons like
>x86-power-control,
>> host-error-monitor, pfr-manager, IntrusionSensor and so on. Other
>lines
>> just called same as in schematics to make it easy for our engineers
>to
>> understand what does it refer to. BTW, most of the lines there not
>used
>> by software and appeared just because dts files are supposed to be
>> hardware description and thus we describe all we have in
>schematics.
>>
>> We can rename all this according to guide you mention, but are you
>> sure, there is any sense to do so?
>> Keep in mind, currently there are lot of dts files which also don't
>> follow convention, so I believe, it is unnecessary work.
>
>I have a strong preference for using the naming document. It provides
>consistency, which makes it easier to review. I'm encouraging that
>for
>any new dts.
>
>If you think it makes the descriptions less useful for your platform
>then that's a reasonable reason to not follow the convention.
>

Actually, what I would prefer is that these well established signal
names that appear in the x86 industry servers be enumerated in the
gpio naming document and be accepted like the original OpenPOWER
legacy names were.   This will clearly show the names that appear=20
on other systems and will help reviewing things like power control=20
applications.

Andrei does this sound reasonable?
