Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD563D0F84
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 15:29:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVGdN1ZsXz30Mk
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 23:29:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FwPLJVaS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FwPLJVaS; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVGd31wTwz2yM5;
 Wed, 21 Jul 2021 23:28:54 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LD4SVg188787; Wed, 21 Jul 2021 09:28:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=1/UqFbGMruDo3Q0vGuZwQjLuoMkBdQ71Br6XNAeVCaQ=;
 b=FwPLJVaStv0j9I+wdLUA/VQPmHLN4jGnfyjE4JCKPJFvAwKFpRfE9Afsg9EOswQ4VzBi
 APV/ndDSowzA3VlROOXNX/FUdQ3ChlB1eBuVsbJb9yroLnJtVVs7perwefkiHgV3+Z8G
 ogklqScJ9RGJ/nbO9wyHButKY3+7FPFHN5uKwjYJuGbN8qCcyynMJoFEHAQHenO3yJp/
 bqnxffnIKBNvsnQlGxUMTkvjg+2nxLFAtgmrg3GUX2NgFMrtDNzqhRtukWM5P1lXqnfW
 9HDL2cmOy1JIJ1v4zWD8uSZJ/zFWtRGTyodEY9zFlc5jzdurlLDVA817eR66nGrN+lKy +g== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xja3byf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 09:28:51 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16LDHVKL020260;
 Wed, 21 Jul 2021 13:28:50 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 39vqdvc540-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 13:28:50 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16LDRok130147048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 13:27:50 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E359124053;
 Wed, 21 Jul 2021 13:27:50 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C99D124062;
 Wed, 21 Jul 2021 13:27:49 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.68.240])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 21 Jul 2021 13:27:49 +0000 (GMT)
Message-ID: <b482a658da7d6488e8b84c20db2efbe098052814.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] fsi: occ: Force sequence numbering per OCC
From: Eddie James <eajames@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Jul 2021 08:27:48 -0500
In-Reply-To: <CACPK8XcBHGsFu0VoNPutC8HYbLcf0WV-KWNixCdGXxWsf1PDVg@mail.gmail.com>
References: <20210716151850.28973-1-eajames@linux.ibm.com>
 <20210716151850.28973-2-eajames@linux.ibm.com>
 <CACPK8XcBHGsFu0VoNPutC8HYbLcf0WV-KWNixCdGXxWsf1PDVg@mail.gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4fvz68dvuIAlPOY2zffvQDIwk87o7CjD
X-Proofpoint-ORIG-GUID: 4fvz68dvuIAlPOY2zffvQDIwk87o7CjD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_08:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107210075
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2021-07-21 at 02:37 +0000, Joel Stanley wrote:
> On Fri, 16 Jul 2021 at 15:19, Eddie James <eajames@linux.ibm.com>
> wrote:
> > Set and increment the sequence number during the submit operation.
> > This prevents sequence number conflicts between different users of
> > the interface. A sequence number conflict may result in a user
> > getting an OCC response meant for a different command. Since the
> > sequence number is now modified, the checksum must be calculated
> > and
> > set before submitting the command.
> > 
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> > @@ -479,11 +483,26 @@ int fsi_occ_submit(struct device *dev, const
> > void *request, size_t req_len,
> >                 return -EINVAL;
> >         }
> > 
> > +       /* Checksum the request, ignoring first byte (sequence
> > number). */
> > +       for (i = 1; i < req_len - 2; ++i)
> > +               checksum += byte_request[i];
> > +
> 
> This could go below, after you've got the sequence number, so the
> checksumming all happens in the same spot?

It definitely could, I had the idea to do the checksumming outside the
mutex in case it took a long time? Probably not worth it though.

> 
> The driver has become a bit of a maze, I can't tell how you're
> deciding what goes in fsi_occ_submit vs occ_write vs occ_putsram. If
> oyu have some ideas on how to simplify it then I would welcome those
> changes.

Well, it doesn't really matter in fsi_occ_submit vs occ_putsram, as the
latter is only called in the former. occ_write wouldn't be used by the
hwmon interface, which is why we're moving some of that to
fsi_occ_submit, to have more in common. Agree it could probably be
organized better but I don't immediately have a good idea how to do
that.

Thanks for the review!
Eddie

> 
> 
> 
> >         mutex_lock(&occ->occ_lock);
> > 
> > -       /* Extract the seq_no from the command (first byte) */
> > -       seq_no = *(const u8 *)request;
> > -       rc = occ_putsram(occ, request, req_len);
> > +       /*
> > +        * Get a sequence number and update the counter. Avoid a
> > sequence
> > +        * number of 0 which would pass the response check below
> > even if the
> > +        * OCC response is uninitialized. Any sequence number the
> > user is
> > +        * trying to send is overwritten since this function is the
> > only common
> > +        * interface to the OCC and therefore the only place we can
> > guarantee
> > +        * unique sequence numbers.
> > +        */
> > +       seq_no = occ->sequence_number++;
> > +       if (!occ->sequence_number)
> > +               occ->sequence_number = 1;
> > +       checksum += seq_no;
> > +
> > +       rc = occ_putsram(occ, request, req_len, seq_no, checksum);
> >         if (rc)
> >                 goto done;

