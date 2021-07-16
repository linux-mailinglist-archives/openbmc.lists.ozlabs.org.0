Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C183CBBEC
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 20:37:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRKjq3FnWz302g
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 04:37:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P0ov+RaF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P0ov+RaF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRKjT2y2nz2ykQ
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jul 2021 04:37:32 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GIbH6D165233; Fri, 16 Jul 2021 14:37:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=7tyfq1wQ5MtvqKTDdde+7cQd7ahohQH+0eK0ivktzt0=;
 b=P0ov+RaF4asrEqtHx+LK0kSQyB/lbsxOt58Kdh2hVBjuMbsmRotj/P18JpbNelc5LveS
 g7p/OqMeb95a7fktLD0ihJWVNe7vf7l9pR18agcq6UK/5p8arD/v8imiIGEWC6wekZqI
 0gm9brMh1o6ZM/fOJHVNrWhgyKnCKRyEOllPKnRIa6BbSI3US8HF5+3zicaV+fqk7qZ0
 lazCNhL2QHNoLggcY1+Glkn4VAzFOgNrKGi9SIufVRqY0RfbWw4Xa6CoN8/MYeeabTD8
 iz8ozczwzpl9iZayfszj9uHB7HvLHRuodxchjKBtez8hbm5UsljfDDgC0/JSvFGiQhuY gw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39udw6jn23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 14:37:28 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GIGlcf024783;
 Fri, 16 Jul 2021 18:34:41 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 39q36fqbhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 18:34:41 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GIYf4s53543206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 18:34:41 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14440AE05F;
 Fri, 16 Jul 2021 18:34:41 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D514AE063;
 Fri, 16 Jul 2021 18:34:39 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.92.96])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 18:34:39 +0000 (GMT)
Message-ID: <81a40f8690d297ebfb6697dbea63279bcf2f24fa.camel@linux.ibm.com>
Subject: Re: [PATCH 1/2] spi: fsi: Reduce max transfer size to 8 bytes
From: Eddie James <eajames@linux.ibm.com>
To: Mark Brown <broonie@kernel.org>
Date: Fri, 16 Jul 2021 13:34:38 -0500
In-Reply-To: <20210716171936.GB4137@sirena.org.uk>
References: <20210716133915.14697-1-eajames@linux.ibm.com>
 <20210716133915.14697-2-eajames@linux.ibm.com>
 <20210716171936.GB4137@sirena.org.uk>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 13Nj9UHN-n_4bSFB_bWzSidggUk0HrnQ
X-Proofpoint-ORIG-GUID: 13Nj9UHN-n_4bSFB_bWzSidggUk0HrnQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_06:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=904
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160113
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2021-07-16 at 18:19 +0100, Mark Brown wrote:
> On Fri, Jul 16, 2021 at 08:39:14AM -0500, Eddie James wrote:
> > Security changes have forced the SPI controllers to be limited to
> > 8 byte reads. Refactor the sequencing to just handle 8 bytes at a
> > time.

Security changes in the SPI controller - in the device microcode. I can
reword the commit if you like.

Thanks,
Eddie

> 
> Which security changes where - somewhere else in Linux?

