Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4190A00FE8
	for <lists+openbmc@lfdr.de>; Fri,  3 Jan 2025 22:34:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPxgD4X82z3cCJ
	for <lists+openbmc@lfdr.de>; Sat,  4 Jan 2025 08:34:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735940086;
	cv=none; b=YPKAjI/P1VtR0Gwi9bJiXE9ozuhiU8nTHT39YLxk7kJbiHlHICZg4HwFkf+TaH0D6vW1a99guFq2vwrWZUX/WOqiCgT+jkm0QLr8nuPq1uQRK7VRFAxtsBpxtlcvY/CUVXLVZaLNjJKGY+mrCBvY+Y2rvO+88GZ1ddA3UnL2kXDUT4CJQ+pqKDBAjmoTxRq2c+n4xS49aZjZXOuTYdlxPe3xK1un5aDGdrJBcXxdncSyfQju3hONPe2Ckw04cO/g882tssw0GvRbXvX0/MjvkrFXRTPQxJFZF34FvbXD3xoXWP15Y5wE0hkTmOOsjFM5KTIjGitysgwPcsd5PF/pnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735940086; c=relaxed/relaxed;
	bh=pl+cP0g50AmBhwjhJuQjtNubKl4nbIBEGdIOD90gU2Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ajAcf4oV+xAP4tOxWyx0ZV9n79S3F0QLUqhDkZONOk62hLtCX3RYMOeMjQpGEdj+bTAcqocVUbb1qxgqcj+YGqE1pbrgSdu27E0BxFeBgjKtShrGeJbLSWImRP7xZS4O34OXE8O+jMZQvyCl59+RwbbbUX//WkyfXppMgFhgesDG8cobSWGb9eLPqM0LK0PbjKMDa4fVZFHGKMtMCpLaPiaxyeOMIZDFUcs8S0JHBLM7yNGnVehemsMXzw7YfPTRpDwn6dXviZcFr2z8dQ0hlzE9sxD1muQAhs7KabjkTfbamBLRxKjv22biEwlKAXD+vaAkscOTE0BjaKlCW6+EKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HpAFPVzl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HpAFPVzl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=anoo@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPxg86gYPz2yD6
	for <openbmc@lists.ozlabs.org>; Sat,  4 Jan 2025 08:34:44 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503HCTTb013851;
	Fri, 3 Jan 2025 21:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pl+cP0
	g50AmBhwjhJuQjtNubKl4nbIBEGdIOD90gU2Q=; b=HpAFPVzlmAsko+WUheMNIP
	3tXwyhfZeqouF2WiezE5NKUA0OVZHDuj3zOtPcBm33uEy7IjS8UeYi7oyU6klhSY
	722mzWXSjed73pkQgC+1z1nldT3u1QIIJIKdMN0xxaYwFBsK1pGmJOLK2Y02QpgP
	twLpjiW2m4wqx3xp4ktI97yTVbLUhEuFAr6L7HrGf33oke3jiQBVGsqZ+j2epC8o
	WbIvoi5z1RqJkMclJPYeAdrJKjQdP+/cLCSl3IeINAengg4FDFZNjm0ZRrLfFOTN
	+8NmpGiLQmIidu0AZeDXTtj8uxCvzy2cqCnPpTxkvK784PIOFb374vQteLUonTmg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43x4xh49fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 21:34:37 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 503JfUhD014564;
	Fri, 3 Jan 2025 21:34:36 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43tunt03yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 21:34:36 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 503LYZgB34865554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 21:34:35 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A7095805A;
	Fri,  3 Jan 2025 21:34:35 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF8105805C;
	Fri,  3 Jan 2025 21:34:34 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.254.137])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  3 Jan 2025 21:34:34 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: Consultation on the invalidation of OpenBMC IMA/EVM function
From: Adriana Kobylak <anoo@linux.ibm.com>
In-Reply-To: <Z2WQqlEfJHyGRDCa@heinlein>
Date: Fri, 3 Jan 2025 15:34:24 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <92D9D801-5FB2-4F74-87FD-196389F10B1D@linux.ibm.com>
References: <056238eba5b645c180b31dfbac427c41@ieisystem.com>
 <Z2WQqlEfJHyGRDCa@heinlein>
To: fanyi@ieisystem.com
X-Mailer: Apple Mail (2.3826.200.121)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uPfoLPBw9IJ2pe5u_Z_RMD3umMHKRms4
X-Proofpoint-GUID: uPfoLPBw9IJ2pe5u_Z_RMD3umMHKRms4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=729 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030190
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

At IBM, we're picking up Stefan's work this year to get the series =
merged and enable IMA on the p10bmc system (AST2600-based). Feel free to =
follow the updates on the series (there should be patch updates in the =
next few weeks), and/or try the series out on your platform.


> On Dec 20, 2024, at 9:43=E2=80=AFAM, Patrick Williams =
<patrick@stwcx.xyz> wrote:
>=20
> On Thu, Dec 19, 2024 at 07:52:55AM +0000, Vantler Fan (=E8=8C=83=E7=9B=8A=
) wrote:
>>=20
>>      I have a problem with IMA/EVM func of OpenBMC. I enabled IMA
>> function, but it doesn't seem to work.
>=20
> I don't know of anyone actively using IMA on OpenBMC.
>=20
> Stefan Berger @ IBM was working on a commit sequence at one point but =
I
> haven't see much activity there.
>=20
>   https://gerrit.openbmc.org/c/openbmc/openbmc/+/74136/2
>=20
> --=20
> Patrick Williams

