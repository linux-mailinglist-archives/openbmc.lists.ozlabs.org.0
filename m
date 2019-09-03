Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFDFA7395
	for <lists+openbmc@lfdr.de>; Tue,  3 Sep 2019 21:22:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NGzb4CCzzDqqY
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 05:22:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.133.20; helo=mx0a-00154904.pphosted.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="cG4Tslcz"; 
 dkim-atps=neutral
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com
 [148.163.133.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NGyr48mGzDqk7
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 05:21:22 +1000 (AEST)
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
 by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x83JKbGR015536
 for <openbmc@lists.ozlabs.org>; Tue, 3 Sep 2019 15:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=z5rL1nFRqS/6HZHt7Z7t+e7oOfA9+B+uj79QoKozeXg=;
 b=cG4TslczJHIiUawWZjQhBG2/QC5Es13gOsfM3G85z7v7/sHYWP8udIQVSeFRiCKanxrS
 vykvD9Be/r4lcsdGfa5qfLnlqzpCe2y2J7DJlnnDEHThMZMlZ2IiqdM5hB5cQz6MQpR4
 /cb5rugpd2fHMAdjx4q3z9J9ebm7x59mz06GtvDpEQC4y47ERhZlOMeQ94lXq0u2dVsh
 n1ryKA7H80mvRwm3HPyeFaDFdPHZ3GFj1vA+C+On3k+06kw1zb0KBzKTElgir/7HCYJr
 +Pt9bc3+rQbX7UMuKQFLoCUcArf/BhIwvjf+pxN9n6WvjDTjjs90v8klgSWwQk3iMJ6L jw== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com
 [67.231.157.37])
 by mx0a-00154904.pphosted.com with ESMTP id 2uqm2dc0sd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Sep 2019 15:21:18 -0400
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x83ETRWw024757
 for <openbmc@lists.ozlabs.org>; Tue, 3 Sep 2019 15:21:17 -0400
Received: from ausxipps306.us.dell.com (AUSXIPPS306.us.dell.com
 [143.166.148.156])
 by mx0b-00154901.pphosted.com with ESMTP id 2ur7jh7am1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Sep 2019 15:21:17 -0400
X-LoopCount0: from 10.166.135.97
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="369915142"
From: <Justin.Lee1@Dell.com>
To: <benwei@fb.com>, <davem@davemloft.net>
Subject: RE: [PATCH net-next] net/ncsi: support unaligned payload size in
 NC-SI cmd handler
Thread-Topic: [PATCH net-next] net/ncsi: support unaligned payload size in
 NC-SI cmd handler
Thread-Index: AdVhOKsnD7LLLBrzTcm5Yllqe1NFWAAskeUAAAnNpwAAHj8T8A==
Date: Tue, 3 Sep 2019 19:21:07 +0000
Message-ID: <5d58b4eefc7c4d22b60dd1f6ef51093f@AUSX13MPS306.AMER.DELL.COM>
References: <CH2PR15MB368619179F403EAE47FD61F7A3BE0@CH2PR15MB3686.namprd15.prod.outlook.com>
 <20190902.120300.174900457187536042.davem@davemloft.net>
 <CH2PR15MB36869BE1AA44813CE293891BA3BE0@CH2PR15MB3686.namprd15.prod.outlook.com>
In-Reply-To: <CH2PR15MB36869BE1AA44813CE293891BA3BE0@CH2PR15MB3686.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Justin_Lee1@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2019-09-03T19:21:05.2123280Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
 aiplabel=External Public
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.242.75]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-01_01:2019-08-29,2019-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909010057
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1906280000
 definitions=main-1909030191
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, sam@mendozajonas.com,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

That is right. It is necessary to adjust the len for padding on both places=
.

Thanks,
Justin


> > > Update NC-SI command handler (both standard and OEM) to take into=20
> > > account of payload paddings in allocating skb (in case of payload=20
> > > size is not 32-bit aligned).
> > >=20
> > > The checksum field follows payload field, without taking payload=20
> > > padding into account can cause checksum being truncated, leading to=20
> > > dropped packets.
> > >=20
> > > Signed-off-by: Ben Wei <benwei@fb.com>
> >
> > If you have to align and add padding, I do not see where you are=20
> > clearing out that padding memory to make sure it is initialized.
> >
> > You do comparisons with 'payload' but make adjustments to 'len'.
> >
> > The logic is very confusing.
>=20
> Yes let me clarify a bit.=20
>=20
> In the code 'payload' is the exact NC-SI payload length, which goes into =
NC-SI packet header and needs to be actual unpadded payload length.
>=20
> 'len' is used to allocate total NC-SI packet buffer (include padding).=20
>=20
> The original calculation of 'len' was done by summing up NCSI header + pa=
yload + checksum, without taking into account of possible padding, e.g.
>=20
>         len +=3D sizeof(struct ncsi_cmd_pkt_hdr) + 4;  /* 4 is the checks=
um size */
>        if (nca->payload < 26)
>                 len +=3D 26;
>         else
>                len +=3D nca->payload;
>         /* Allocate skb */
>         skb =3D alloc_skb(len, GFP_ATOMIC);
>=20
> This works today for all standard NC-SI commands (in spec v1.1) because a=
ll standard commands have payload size < 26, and packet size is then set to=
 minimum of 46 (16 hdr + 26 payload + 4 cksum) bytes.
>=20
> And mem clearing is done in each of the standard cmd handlers, e.g.=20
> ncsi_cmd_handler_sp, ncsi_cmd_handler_ae.
>=20
>=20
>=20
> The problem occurs if payload >=3D 26 and is unaligned.  This could happe=
n on some OEM commands, and I see this happening when we carry PLDM traffic=
 over NC-SI packet.=20
> (PLDM header being 3 bytes and payload size can be large)=20
>=20
> The skb allocated would be too small, and later when checksum is calculat=
ed and written:
>=20
> 	pchecksum =3D (__be32 *)((void *)h + sizeof(struct ncsi_pkt_hdr) +
> 		    ALIGN(nca->payload, 4));
> 	*pchecksum =3D htonl(checksum);
>=20
> Part of the checksum would fall outside of our allocated buffer.
>=20
> PLDM over NC-SI and OEM NC-SI commands are currently handled in
>=20
> @@ -213,17 +213,22 @@ static int ncsi_cmd_handler_oem(struct sk_buff *skb=
,
>=20
> So here I ensure the skb allocation takes padding into account, and do th=
e initial mem clearing to set the padding bytes
>=20
> +       unsigned short payload =3D ALIGN(nca->payload, 4);
>=20
>         len =3D sizeof(struct ncsi_cmd_pkt_hdr) + 4;
> -       if (nca->payload < 26)
> +       if (payload < 26)
>                 len +=3D 26;
>         else
> -               len +=3D nca->payload;
> +               len +=3D payload;
>=20
>         cmd =3D skb_put_zero(skb, len);
>         memcpy(&cmd->mfr_id, nca->data, nca->payload);
>=20
> So in this patch I updated both standard command handler (in case future =
spec updates adds commands with payload >=3D 26) and OEM/generic command ha=
ndler to support unaligned payload size. =20
>=20
> Regards,
> -Ben
