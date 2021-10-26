Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0E943B8D3
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 19:59:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf02H5vbwz2yfc
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 04:59:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dCM1Y2fW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dCM1Y2fW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf01v0rvFz2y7P
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 04:58:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QG6HGl031615; 
 Tue, 26 Oct 2021 17:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : message-id : content-transfer-encoding : content-type :
 mime-version : references : subject; s=pp1;
 bh=NHjwMlHVl/xeUlTp3DXGTIm9jI5ohNSbTn1T6uBLCNk=;
 b=dCM1Y2fWne8ILep4equM1enbIPv4GYUeMIHhJGe9h7hPtV7TMnvgQzs3Ak5IuQafqI+0
 bvcL5ZyGkXmZvvLBpy5ZGKLX/PWcM494B1LJJ4nu1sQDMryZt2MBsganPpN5KlJPn653
 YlFrdWRG13SWubfTNPTnl4bl6AxzV5elDHHJjAqy7ieIC2k0bV7DMaOh/SqDQC1U0N7N
 eX6mGKNOXWdy9p8J2cFStLwJKVCP1JjqYBpADV0qYQMNEZFR0shOpW3xGR+BhG+dpSrB
 oEYfWXcnD62lM5nqmRHKlnb4zeou1w6xFAiog59i4/2SVH7ZYg6aas+yEeSQN3POB+oQ kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4k299t9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 17:58:52 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19QGwDx5023990;
 Tue, 26 Oct 2021 17:58:51 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bx4k299sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 17:58:51 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19QHrucE017475;
 Tue, 26 Oct 2021 17:58:50 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3bx4fkp3ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 17:58:50 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19QHwn1f52101416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Oct 2021 17:58:49 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 308EDAE068;
 Tue, 26 Oct 2021 17:58:49 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 11718AE067;
 Tue, 26 Oct 2021 17:58:49 +0000 (GMT)
Received: from mww0331.wdc07m.mail.ibm.com (unknown [9.208.69.64])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 26 Oct 2021 17:58:49 +0000 (GMT)
In-Reply-To: <20211026054904.8888-1-george.hung@quantatw.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "George Hung" <ghung.quanta@gmail.com>
Date: Tue, 26 Oct 2021 17:58:46 +0000
Message-ID: <OF39800834.8A8B58CD-ON0025877A.0062C3BB-0025877A.0062C3BD@ibm.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20211026054904.8888-1-george.hung@quantatw.com>
X-Mailer: Lotus Domino Web Server Release 11.0.1FP2HF117   October 6, 2021
X-MIMETrack: Serialize by http on MWW0331/01/M/IBM at 10/26/2021 17:58:46,
 Serialize complete at 10/26/2021 17:58:46
X-Disclaimed: 55687
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7F4qiGPOwNmBK4UihPZzOFj8HHU5pJCT
X-Proofpoint-ORIG-GUID: SLmkYq9blz6gFFy_qJKa3BUSdhLcgtRj
Subject: Re: [PATCH dev-5.14 v1] ARM: dts: nuvoton: gbs: Change the name of the
 partitions
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 adultscore=0 impostorscore=0 mlxlogscore=979 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260096
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
Cc: kwliu@nuvoton.com, Fran.Hsu@quantatw.com, benjaminfair@google.com,
 wltu@google.com, openbmc@lists.ozlabs.org, brandonkim@google.com,
 tomer.maimon@nuvoton.com, Avi.Fishman@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2">On October 26, 2021, George Hung wrote:<br><br><div>&gt;Subject: [EX=
TERNAL] [PATCH dev-5.14 v1] ARM: dts: nuvoton: gbs:<br></div>&gt;Change the=
 name of the partitions<br>&gt;<br>&gt;Change the name of the partitions fo=
r BIOS primary and<br>&gt;secondary SPI EEPROMs<br>&gt;<br>&gt;Signed-off-b=
y: George Hung &lt;<a href=3D"mailto:george.hung@quantatw.com" target=3D"=
=5Fblank" rel=3D"noopener noreferrer">george.hung@quantatw.com</a>&gt;<div>=
<br></div><div>These new names have more meaning to the platform.</div><div=
><br></div><div>Acked-by: Milton Miller &lt;<a href=3D"mailto:miltonm@us.ib=
m.com" target=3D"=5Fblank" rel=3D"noopener noreferrer">miltonm@us.ibm.com</=
a>&gt;</div><div><br>&gt;---<br>&gt; arch/arm/boot/dts/nuvoton-npcm730-gbs.=
dts | 20 ++++++++++----------<br>&gt; 1 file changed, 10 insertions(+), 10 =
deletions(-)<br>&gt;<br>&gt;diff --git a/arch/arm/boot/dts/nuvoton-npcm730-=
gbs.dts<br>&gt;b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts<br>&gt;index f20=
c2ae4f576..6894b162b050 100644<br>&gt;--- a/arch/arm/boot/dts/nuvoton-npcm7=
30-gbs.dts<br>&gt;+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts<br>&gt;@@=
 -414,17 +414,17 @@ spi-nor@0 {<br>&gt;                 spi-max-frequency =
=3D &lt;50000000&gt;;<br>&gt;                 spi-rx-bus-width =3D &lt;2&gt=
;;<br>&gt;                 m25p,fast-read;<br>&gt;-                label =
=3D "pnor";<br>&gt;+                label =3D "bios";<br>&gt;              =
   partitions@a0000000 {<br>&gt;                         compatible =3D "fi=
xed-partitions";<br>&gt;                         #address-cells =3D &lt;1&g=
t;;<br>&gt;                         #size-cells =3D &lt;1&gt;;<br>&gt;-    =
                    pnor-primary@0 {<br>&gt;-                              =
  label =3D "pnor-primary";<br>&gt;+                        bios-primary@0 =
{<br>&gt;+                                label =3D "bios-primary";<br>&gt;=
                                 reg =3D &lt;0x0000000 0x2000000&gt;;<br>&g=
t;                         };<br>&gt;-                        pnor-scratch@=
2000000 {<br>&gt;-                                label =3D "pnor-scratch";=
<br>&gt;+                        bios-secondary@2000000 {<br>&gt;+         =
                       label =3D "bios-secondary";<br>&gt;                 =
                reg =3D &lt;0x2000000 0x2000000&gt;;<br>&gt;               =
          };<br>&gt;                 };<br>&gt;@@ -437,17 +437,17 @@ spi-no=
r@1 {<br>&gt;                 spi-max-frequency =3D &lt;50000000&gt;;<br>&g=
t;                 spi-rx-bus-width =3D &lt;2&gt;;<br>&gt;                 =
m25p,fast-read;<br>&gt;-                label =3D "pnor-2";<br>&gt;+       =
         label =3D "bios-2";<br>&gt;                 partitions@a0000000 {<=
br>&gt;                         compatible =3D "fixed-partitions";<br>&gt; =
                        #address-cells =3D &lt;1&gt;;<br>&gt;              =
           #size-cells =3D &lt;1&gt;;<br>&gt;-                        pnor-=
primary@0 {<br>&gt;-                                label =3D "pnor-2-prima=
ry";<br>&gt;+                        bios-2-primary@0 {<br>&gt;+           =
                     label =3D "bios-2-primary";<br>&gt;                   =
              reg =3D &lt;0x0000000 0x2000000&gt;;<br>&gt;                 =
        };<br>&gt;-                        pnor-scratch@2000000 {<br>&gt;- =
                               label =3D "pnor-2-scratch";<br>&gt;+        =
                bios-2-secondary@2000000 {<br>&gt;+                        =
        label =3D "bios-2-secondary";<br>&gt;                              =
   reg =3D &lt;0x2000000 0x2000000&gt;;<br>&gt;                         };<=
br>&gt;                 };<br>&gt;-- <br>&gt;2.32.0<br>&gt;<br>&gt;</div></=
font><BR>
<BR>
