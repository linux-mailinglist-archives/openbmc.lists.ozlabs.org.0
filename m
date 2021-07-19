Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C27CC3CE05B
	for <lists+openbmc@lfdr.de>; Mon, 19 Jul 2021 17:57:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT61j5ZV8z30KH
	for <lists+openbmc@lfdr.de>; Tue, 20 Jul 2021 01:57:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f6p3sYhg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f6p3sYhg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT61P400Sz2yMn
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jul 2021 01:57:29 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JFXlMb151446; Mon, 19 Jul 2021 11:57:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=N0byvRrUBTP1mplL4LvSP6WROEUjFlN+lQeSw9vy144=;
 b=f6p3sYhga5IB8qdncCSsTHxWJTLhm35Ep27iG3C3XpMZte1tZoC4TKYxYB+y0tG1g4Kf
 3tp0coNZUx6IBDrsmw6Pnub9o4uT8oxOapn/7BxEVv4TAvoMz1K5GWAwIfH5z+lNopl5
 8oezwP0ylpRsZVC40c0jodoExRLaPCD5fqMqlN/mcyobyBmEJZAp5IOC7lr8B4NsgnIj
 XTSDOr6/n382ys7uDF0NNXKe9iLVnzBLxi90V915h8qwmn7pems/NJI+Fv/o7OVyCPBH
 0BZN0NUYhEpX6JAqhhueTFzUSuV9SrLsXjpZhC5axW0cUfG8r7SwRYvYVLsbLtFZHfNI Xw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39wc510rrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 11:57:22 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JFkjr2007280;
 Mon, 19 Jul 2021 15:57:22 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 39vvw6pxgx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 15:57:22 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16JFvLl515401234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 15:57:21 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D9E3AE066;
 Mon, 19 Jul 2021 15:57:21 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77E27AE064;
 Mon, 19 Jul 2021 15:57:20 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.34.96])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 19 Jul 2021 15:57:20 +0000 (GMT)
Message-ID: <a92fdddcd2c75bc6c11ad0b2824bbac84db5b06d.camel@linux.ibm.com>
Subject: Re: [PATCH 0/2] spi: fsi: Reduce max transfer size to 8 bytes
From: Eddie James <eajames@linux.ibm.com>
To: David Laight <David.Laight@ACULAB.COM>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>
Date: Mon, 19 Jul 2021 10:57:19 -0500
In-Reply-To: <0ed7c393b7aa4252a48cd2397ac251eb@AcuMS.aculab.com>
References: <20210716133915.14697-1-eajames@linux.ibm.com>
 <0ed7c393b7aa4252a48cd2397ac251eb@AcuMS.aculab.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GV610ifuV2bi6qtUjTPO42yxU2_c29Y1
X-Proofpoint-ORIG-GUID: GV610ifuV2bi6qtUjTPO42yxU2_c29Y1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190090
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 2021-07-17 at 13:46 +0000, David Laight wrote:
> From: Eddie James
> > Sent: 16 July 2021 14:39
> > 
> > The security restrictions on the FSI-attached SPI controllers have
> > been applied universally to all controllers, so the controller can
> > no
> > longer transfer more than 8 bytes for one transfer. Refactor the
> > driver
> > to remove the looping and support for larger transfers, and remove
> > the
> > "restricted" compatible string, as all the controllers are now
> > considered restricted.
> 
> Aren't there significant performance (and device wear?) penalties
> for doing short SPI eeprom writes?

Probably so. However there is no choice in the matter, as the SPI
controller can't process larger reads/writes.
(I should note that the controller/driver CAN process up to 40 byte
writes. However, the driver must report the minimum of read and write
sizes in the max_transfer_size callback, so no client driver should
request larger than the max read size - 8 bytes).

Thanks,
Eddie

> 
> IIRC (and I'm not getting my serial busses confused) a write request
> can request an aligned transfer of up to (typically) 32 bytes.
> At which point you need to wait for the status to indicate
> 'complete'.
> 
> So restricting writes to 8 bytes increases block write times
> by a factor of 4.
> 
> Increasing the numbers of writes by a factor or 4 may also have
> an effect on device wear - but that is more likely only affected
> by erase cycles.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes,
> MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

