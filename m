Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C641787B
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 18:24:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HGHS90NJ5z307x
	for <lists+openbmc@lfdr.de>; Sat, 25 Sep 2021 02:24:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HDqCsFsa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HDqCsFsa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HGHRl5VqFz2yLJ
 for <openbmc@lists.ozlabs.org>; Sat, 25 Sep 2021 02:24:35 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18OEhTF8015262; 
 Fri, 24 Sep 2021 12:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=KIR4t+PVxdF4wNevogKevRSCV5a1TzGPXTcuAcmuJ/Q=;
 b=HDqCsFsaZjMM1+GoMHU3MYXwqbMIQtL+kURwm79JY1QSYKuesrGTmdDAcAD/VIEsLcX2
 Y/A5Nufg6w2G39cbJGYgRp6lumo0GMj4LNRCxP/b3SGCz+NHzq7H8lZkQCSrMqtPimo4
 u/buhiNFVVnySNtieIPxEDn7CiBasHNqdGbsr/lhCqpIdr4oq0w0nvznmUEY5okScqKf
 i4kMp59eCls952qBSyBTyznj/A60jvHFGbfezADfdeHl1cLgVhDHSL7Rxk5Ddggh149I
 uh46S3h8YAkIeD6cSVW0rw4u5BICRW/35c06AU9qnIUtKGyOfK6z96AOyh1yLFj9YUGv pA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b9chy1dct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 12:24:30 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18OG9rUq002086;
 Fri, 24 Sep 2021 16:24:29 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3b93g64ca1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 16:24:29 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18OGORBd53150162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Sep 2021 16:24:27 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5063AE060;
 Fri, 24 Sep 2021 16:24:27 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EAD2AE062;
 Fri, 24 Sep 2021 16:24:27 +0000 (GMT)
Received: from mww0331.wdc07m.mail.ibm.com (unknown [9.208.69.64])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 24 Sep 2021 16:24:27 +0000 (GMT)
In-Reply-To: <20210924161218.16442-1-eajames@linux.ibm.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "Eddie James" <eajames@linux.ibm.com>
Date: Fri, 24 Sep 2021 16:24:25 +0000
Message-ID: <OF48CE84E9.E83C6D64-ON0025875A.005A2060-0025875A.005A2064@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20210924161218.16442-1-eajames@linux.ibm.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF114   September 2, 2021
X-MIMETrack: Serialize by http on MWW0331/01/M/IBM at 09/24/2021 16:24:25,
 Serialize complete at 09/24/2021 16:24:25
X-Disclaimed: 8615
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hJUFHcDnfdQa37Omjr51Zfbg3zBU4fW7
X-Proofpoint-GUID: hJUFHcDnfdQa37Omjr51Zfbg3zBU4fW7
Subject: Re: [PATCH linux dev-5.14] ARM: dts: aspeed: rainier and everest:
 Remove PCA gpio specification
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_05,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240102
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
Cc: andrew@aj.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sep 24, 2021, Eddie James wrote:
>Specifying gpio nodes under PCA led controllers no longer does
>anything,
>so remove those nodes in the device trees.
>

Please reference the (upstream) commit using the standard=20
99988877766 ("description here") format this was made=20
extraneous.

Thanks,
milton

