Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C1C24340A
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 08:36:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRxfr26P9zDqc1
	for <lists+openbmc@lfdr.de>; Thu, 13 Aug 2020 16:36:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vishwa@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lMCDLB9z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRxdr1HXdzDqZC
 for <openbmc@lists.ozlabs.org>; Thu, 13 Aug 2020 16:35:26 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D6WUxU112424; Thu, 13 Aug 2020 02:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : subject : from :
 to : cc : message-id : references : in-reply-to : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=e/kp3XvydZnh3EpOuBl5Y1NMb94L3MtoLKMfqgvnEXc=;
 b=lMCDLB9zIw0A5KiuMcPbyHw9io4B+OmO45/NaDi6f1tgRT80pTFjzRweOJ75ozHCjgVo
 lU7LFJvdaTLGqCP35SZPD974sa9PmH/ejw2pal/MCPz+hDIolhIS+y5EaYDWFrdhZ8sg
 BLqkMAZwkndFVSEzkaZ29YMkJ96c2/aC8gaKJU0Iha2XDW0qPGU9oFxWgxeRx2DBa4Rw
 h3IpyboWTVQKMO/e/lhwKAVhrWVZtoxWdnDHQzJ8xFc98zzkjqIwCiFB2ZYeKXf4eERT
 SztybrxJzOfMzde4JcaE+ANmSuErUJnr33TSsNJ+GhVZrolvEMt3QRoenyihDiWdsY3E cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32v7v0txyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 02:35:19 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07D6WWw1112546;
 Thu, 13 Aug 2020 02:35:19 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32v7v0txxf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 02:35:19 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07D6Jvo8024165;
 Thu, 13 Aug 2020 06:35:17 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 32skp8376x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 06:35:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07D6ZF1911862294
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 06:35:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12E16A4064;
 Thu, 13 Aug 2020 06:35:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB7FAA4065;
 Thu, 13 Aug 2020 06:35:13 +0000 (GMT)
Received: from [192.168.0.100] (unknown [9.79.217.116])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 06:35:13 +0000 (GMT)
User-Agent: Microsoft-MacOutlook/16.39.20071300
Date: Thu, 13 Aug 2020 12:05:13 +0530
Subject: Re: [PATCH linux dev-5.7 2/2] rainier: Add LEDs that are controlled
 by ASPEED
From: vishwanatha subbanna <vishwa@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>,
 Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
 Andrew Geissler <geissonator@yahoo.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Message-ID: <9E424826-EF05-49B6-B2EE-6F0A29A50CC6@linux.ibm.com>
Thread-Topic: [PATCH linux dev-5.7 2/2] rainier: Add LEDs that are controlled
 by ASPEED
References: <1596022243-8788-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <CACPK8XdV8P4S2k+fkatMDBmDKHTHFto_sDbg1mJt_EOPR2LS+g@mail.gmail.com>
In-Reply-To: <CACPK8XdV8P4S2k+fkatMDBmDKHTHFto_sDbg1mJt_EOPR2LS+g@mail.gmail.com>
Mime-version: 1.0
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_04:2020-08-11,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130047
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



=EF=BB=BFOn 13/08/20, 8:45 AM, "Joel Stanley" <joel@jms.id.au> wrote:

    On Wed, 29 Jul 2020 at 11:30, <vishwa@linux.vnet.ibm.com> wrote:
    >
    > From: Vishwanatha Subbanna <vishwa@linux.ibm.com>
    >
    > These are the LEDs that have direct GPIO connection from ASPEED

    Do you mean directly connected to the BMC, and not via a GPIO expander?

Correct. Directly connected to ASPEED.

    Convetion is to name the patches with a prefix:

     ARM: dts: aspeed: rainier: Add directly controlled LEDs

I will update

    >
    > Signed-off-by: Vishwanatha Subbanna <vishwa@linux.ibm.com>
    > Reviewed-by: Eddie James <eajames@linux.ibm.com>
    > ---
    >  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 24 ++++++++++++++++++=
++++--
    >  1 file changed, 22 insertions(+), 2 deletions(-)
    >
    > diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/=
boot/dts/aspeed-bmc-ibm-rainier.dts
    > index 9b28a30..d1a588f 100644
    > --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
    > +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
    > @@ -124,6 +124,26 @@
    >         leds {
    >                 compatible =3D "gpio-leds";
    >
    > +               /* BMC Card fault LED at the back */
    > +               bmc-ingraham0 {
    > +                       gpios =3D <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE=
_LOW>;
    > +               };
    > +
    > +               /* Enclosure ID LED at the back */
    > +               rear-enc-id0 {
    > +                       gpios =3D <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE=
_LOW>;
    > +               };
    > +
    > +               /* Enclosure fault LED at the back */
    > +               rear-enc-fault0 {
    > +                       gpios =3D <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE=
_LOW>;
    > +               };
    > +
    > +               /* PCIE slot power LED */
    > +               pcieslot-power {
    > +                       gpios =3D <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE=
_LOW>;
    > +               };
    > +
    >                 /* System ID LED that is at front on Op Panel */
    >                 front-sys-id0 {
    >                         retain-state-shutdown;
    > @@ -167,7 +187,7 @@
    >         /*E0-E7*/       "","","","","","","","",
    >         /*F0-F7*/       "","","","","","","","",
    >         /*G0-G7*/       "","","","","","","","",
    > -       /*H0-H7*/       "","","","","","","","",
    > +       /*H0-H7*/       "","bmc-ingraham0","rear-enc-id0","rear-enc-f=
ault0","","","","",

    I think the guideline is to name GPIOs based on their use, so
    bmc-ingraham0 should be fault-bmc-ingraham0 if we follow the psu
    presence GPIO convention of function-name.

This LED is used for Identification and Fault as well.

    I think we had some documentation written up on naming conventions.

    Brad, do you have any input here?

    >         /*I0-I7*/       "","","","","","","","",
    >         /*J0-J7*/       "","","","","","","","",
    >         /*K0-K7*/       "","","","","","","","",
    > @@ -175,7 +195,7 @@
    >         /*M0-M7*/       "","","","","","","","",
    >         /*N0-N7*/       "","","","","","","","",
    >         /*O0-O7*/       "","","","usb-power","","","","",
    > -       /*P0-P7*/       "","","","","","","","",
    > +       /*P0-P7*/       "","","","","pcieslot-power","","","",
    >         /*Q0-Q7*/       "cfam-reset","","","","","","","",
    >         /*R0-R7*/       "","","","","","","","",
    >         /*S0-S7*/       "presence-ps0","presence-ps1","presence-ps2",=
"presence-ps3",
    > --
    > 1.8.3.1
    >


