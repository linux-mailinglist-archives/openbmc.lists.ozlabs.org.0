Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9133D0FC6
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 15:41:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GVGvw6SQpz30BH
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 23:41:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hO9td72A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hO9td72A; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GVGvf3F2Kz2yRT;
 Wed, 21 Jul 2021 23:41:34 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16LDWq0i138992; Wed, 21 Jul 2021 09:41:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=5tfzKCPK20zh/0tlMtLLaUhtAC6OBisxnQ9Ig6KzjqA=;
 b=hO9td72A2MwybKbpL1gmKTPv4JdpbQ1flrWQg9JhmcDX04SAOvrEAWmb4I2/rY3Tj8vS
 lwQnDYd4dK9jYE/IRtHBZqmUml2R3HG+mVY0sTCA29CITPt5/H8aeXYICWb45zGD+J3R
 habnYIIfF8aEqbG5Xenebm+Mko1SiAcNaj37zoxiifBEwK+uns8TNz3IXVv0sEDDZcjz
 Y47hOli2bdnEoc50j4Ns3tSoPTAXBewasHa/WYl0rZRWpVC+/gneoyISOLNYh47czGbZ
 7r14HrwNMMXz+GbP77NxfRrJhHQAEjAv6V9aVqbspmiUsis57HQDh7o93Kiu9mwOIj1D Cw== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39xm9agubd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 09:41:30 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16LDYBOx007114;
 Wed, 21 Jul 2021 13:41:29 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 39upuc5s1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Jul 2021 13:41:29 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16LDfSdg33948080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Jul 2021 13:41:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8113AAC06B;
 Wed, 21 Jul 2021 13:41:28 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C16B0AC069;
 Wed, 21 Jul 2021 13:41:27 +0000 (GMT)
Received: from v0005c16 (unknown [9.211.68.240])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 21 Jul 2021 13:41:27 +0000 (GMT)
Message-ID: <455d75f7f21d8561df68eaa052f6cb0245b96c36.camel@linux.ibm.com>
Subject: Re: [PATCH 2/3] hwmon: (occ) Remove sequence numbering and checksum
 calculation
From: Eddie James <eajames@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Jul 2021 08:41:27 -0500
In-Reply-To: <CACPK8XcgF7i+b8P1AUDRYtWZeMDwG7Mjw74pFpVKVx6ZdJJKzw@mail.gmail.com>
References: <20210716151850.28973-1-eajames@linux.ibm.com>
 <20210716151850.28973-3-eajames@linux.ibm.com>
 <CACPK8XcgF7i+b8P1AUDRYtWZeMDwG7Mjw74pFpVKVx6ZdJJKzw@mail.gmail.com>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-16.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZJE2W32vgqBCiC9D3ehSMqIr94559YXO
X-Proofpoint-ORIG-GUID: ZJE2W32vgqBCiC9D3ehSMqIr94559YXO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-21_08:2021-07-21,
 2021-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107210078
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

On Wed, 2021-07-21 at 02:43 +0000, Joel Stanley wrote:
> On Fri, 16 Jul 2021 at 15:19, Eddie James <eajames@linux.ibm.com>
> wrote:
> > Checksumming of the request and sequence numbering is now done in
> > the
> > OCC interface driver in order to keep unique sequence numbers. So
> > remove those in the hwmon driver.
> > 
> > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > ---
> >  drivers/hwmon/occ/common.c | 30 ++++++++++++------------------
> >  drivers/hwmon/occ/common.h |  3 +--
> >  drivers/hwmon/occ/p8_i2c.c | 15 +++++++++------
> >  drivers/hwmon/occ/p9_sbe.c |  4 ++--
> >  4 files changed, 24 insertions(+), 28 deletions(-)
> > 
> > diff --git a/drivers/hwmon/occ/common.c
> > b/drivers/hwmon/occ/common.c
> > index 0d68a78be980..fc298268c89e 100644
> > --- a/drivers/hwmon/occ/common.c
> > +++ b/drivers/hwmon/occ/common.c
> > @@ -132,22 +132,20 @@ struct extended_sensor {
> >  static int occ_poll(struct occ *occ)
> >  {
> >         int rc;
> > -       u16 checksum = occ->poll_cmd_data + occ->seq_no + 1;
> > -       u8 cmd[8];
> > +       u8 cmd[7];
> 
> The shortening of the command seems unrelated?
> 
> If you leave it at 8 then you avoid the special casing below. Is
> there
> any downside to sending the extra 0 byte at the end?

Yes, it would break the checksumming unfortunately. The checksum is
calculated and added at the last two bytes, so if you send more than
your command actually is, the checksum will be in the wrong spot.
> 
> >         struct occ_poll_response_header *header;
> > 
> >         /* big endian */
> > -       cmd[0] = occ->seq_no++;         /* sequence number */
> > +       cmd[0] = 0;                     /* sequence number */
> >         cmd[1] = 0;                     /* cmd type */
> >         cmd[2] = 0;                     /* data length msb */
> >         cmd[3] = 1;                     /* data length lsb */
> >         cmd[4] = occ->poll_cmd_data;    /* data */
> > -       cmd[5] = checksum >> 8;         /* checksum msb */
> > -       cmd[6] = checksum & 0xFF;       /* checksum lsb */
> > -       cmd[7] = 0;
> > +       cmd[5] = 0;                     /* checksum msb */
> > +       cmd[6] = 0;                     /* checksum lsb */
> > --- a/drivers/hwmon/occ/p8_i2c.c> +++ b/drivers/hwmon/occ/p8_i2c.c
> > @@ -97,18 +97,21 @@ static int p8_i2c_occ_putscom_u32(struct
> > i2c_client *client, u32 address,
> >  }
> > 
> >  static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32
> > address,
> > -                                u8 *data)
> > +                                u8 *data, size_t len)
> >  {
> > -       __be32 data0, data1;
> > +       __be32 data0 = 0, data1 = 0;
> > 
> > -       memcpy(&data0, data, 4);
> > -       memcpy(&data1, data + 4, 4);
> > +       memcpy(&data0, data, min(len, 4UL));
> 
> The UL here seems unnecessary (and dropping it should fix your 0day
> bot warnings).

Yea, I think I just need min_t

Thanks for the review!
Eddie

> 
> But I think it would be simpler to go back to a fixed length of 8.
> 
> > +       if (len > 4UL) {
> > +               len -= 4;
> > +               memcpy(&data1, data + 4, min(len, 4UL));
> > +       }
> > 
> >         return p8_i2c_occ_putscom_u32(client, address,
> > be32_to_cpu(data0),
> >                                       be32_to_cpu(data1));
> >  }

