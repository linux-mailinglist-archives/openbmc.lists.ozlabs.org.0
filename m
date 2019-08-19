Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDA894EC5
	for <lists+openbmc@lfdr.de>; Mon, 19 Aug 2019 22:18:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46C4xN4VnqzDqsW
	for <lists+openbmc@lfdr.de>; Tue, 20 Aug 2019 06:18:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.137.20; helo=mx0b-00154904.pphosted.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="vkhjKLxc"; 
 dkim-atps=neutral
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46C4wh2TvCzDqpL
 for <openbmc@lists.ozlabs.org>; Tue, 20 Aug 2019 06:17:34 +1000 (AEST)
Received: from pps.filterd (m0170398.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JKFFX7022461
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 16:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=wuyEk/zDagIBfKS6tCJocihF17FJVBfh+FDTYSA2il0=;
 b=vkhjKLxc9WTiJJCLIWKwkarsheKqGvx0Hm/ydaXSMtaU2JH0hfJeaEKS42KOUFYeU8Wj
 n2V90eJ1633Erwky+9On7aU5Fx605REqoMz28l89fJ64LefAt+8ZMw98dahL2Sdehk2i
 vU6ap4IwXbXoqFP15a+Twt88ovHRNvuJiBukQarbqahxz+bIBKq0ix18B/Fxyy0+osIH
 do2P4T/zrNTxSSEum6ADbjk3U8bS66oQCMyLwruA2LHSzOHGU6tdc5I8nX4xk2kQmI6B
 pckV6fT72hcyHx/c682Cl/TJgz8VrZnYp8Cl9pQ+uIwjQoH1INICdFhhUduqDe2gzfSU NQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 2uect8rf5y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 16:17:30 -0400
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7JKClAI024385
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 16:17:29 -0400
Received: from ausxippc110.us.dell.com (AUSXIPPC110.us.dell.com
 [143.166.85.200])
 by mx0a-00154901.pphosted.com with ESMTP id 2ufxkfv1h1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 19 Aug 2019 16:17:29 -0400
X-LoopCount0: from 10.166.135.95
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="845675803"
From: <Justin.Lee1@Dell.com>
To: <benwei@fb.com>
Subject: RE: [PATCH] net/ncsi: add control packet payload to NC-SI commands
 from netlink
Thread-Topic: [PATCH] net/ncsi: add control packet payload to NC-SI commands
 from netlink
Thread-Index: AdVWRzWK9Wcjcdd/SW6uTu9wV1cgUQAe69Yg
Date: Mon, 19 Aug 2019 20:17:26 +0000
Message-ID: <ec5842fff4de45069a51618eb72df164@AUSX13MPS302.AMER.DELL.COM>
References: <CH2PR15MB368691D280F882864A6D356DA3A80@CH2PR15MB3686.namprd15.prod.outlook.com>
In-Reply-To: <CH2PR15MB368691D280F882864A6D356DA3A80@CH2PR15MB3686.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Justin_Lee1@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2019-08-19T20:17:25.5740389Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual;
 aiplabel=External Public
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908190205
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908190206
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
 linux-kernel@vger.kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ben,

I have similar fix locally with different approach as the command handler m=
ay have some expectation for those byes.
We can use NCSI_PKT_CMD_OEM handler as it only copies data based on the pay=
load length.

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index 5c3fad8..3b01f65 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -309,14 +309,19 @@ static struct ncsi_request *ncsi_alloc_command(struct=
 ncsi_cmd_arg *nca)
=20
 int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 {
+ struct ncsi_cmd_handler *nch =3D NULL;
        struct ncsi_request *nr;
+ unsigned char type;
        struct ethhdr *eh;
-   struct ncsi_cmd_handler *nch =3D NULL;
        int i, ret;
=20
+ if (nca->req_flags =3D=3D NCSI_REQ_FLAG_NETLINK_DRIVEN)
+         type =3D NCSI_PKT_CMD_OEM;
+ else
+         type =3D nca->type;
        /* Search for the handler */
        for (i =3D 0; i < ARRAY_SIZE(ncsi_cmd_handlers); i++) {
-           if (ncsi_cmd_handlers[i].type =3D=3D nca->type) {
+         if (ncsi_cmd_handlers[i].type =3D=3D type) {
                        if (ncsi_cmd_handlers[i].handler)
                                nch =3D &ncsi_cmd_handlers[i];
                        else

Thanks,
Justin



> This patch adds support for NCSI_CMD_SEND_CMD netlink command to load pac=
ket data payload (up to 16 bytes) to standard NC-SI commands.
>=20
> Packet data will be loaded from NCSI_ATTR_DATA attribute similar to NC-SI=
 OEM commands
>=20
> Signed-off-by: Ben Wei <benwei@fb.com>
> ---
>  net/ncsi/internal.h     | 7 ++++---
>  net/ncsi/ncsi-netlink.c | 9 +++++++++
>  2 files changed, 13 insertions(+), 3 deletions(-)
>=20
> diff --git a/net/ncsi/internal.h b/net/ncsi/internal.h index 0b3f0673e1a2=
..4ff442faf5dc 100644
> --- a/net/ncsi/internal.h
> +++ b/net/ncsi/internal.h
> @@ -328,9 +328,10 @@ struct ncsi_cmd_arg {
>  	unsigned short       payload;     /* Command packet payload length */
>  	unsigned int         req_flags;   /* NCSI request properties       */
>  	union {
> -		unsigned char  bytes[16]; /* Command packet specific data  */
> -		unsigned short words[8];
> -		unsigned int   dwords[4];
> +#define NCSI_MAX_DATA_BYTES 16
> +		unsigned char  bytes[NCSI_MAX_DATA_BYTES]; /* Command packet specific =
data  */
> +		unsigned short words[NCSI_MAX_DATA_BYTES / sizeof(unsigned short)];
> +		unsigned int   dwords[NCSI_MAX_DATA_BYTES / sizeof(unsigned int)];
>  	};
>  	unsigned char        *data;       /* NCSI OEM data                 */
>  	struct genl_info     *info;       /* Netlink information           */
> diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c index 8b38=
6d766e7d..7d2a43f30eb1 100644
> --- a/net/ncsi/ncsi-netlink.c
> +++ b/net/ncsi/ncsi-netlink.c
> @@ -459,6 +459,15 @@ static int ncsi_send_cmd_nl(struct sk_buff *msg, str=
uct genl_info *info)
>  	nca.payload =3D ntohs(hdr->length);
>  	nca.data =3D data + sizeof(*hdr);
> =20
> +	if (nca.payload <=3D NCSI_MAX_DATA_BYTES) {
> +		memcpy(nca.bytes, nca.data, nca.payload);
> +	} else {
> +		netdev_info(ndp->ndev.dev, "NCSI:payload size %u exceeds max %u\n",
> +			    nca.payload, NCSI_MAX_DATA_BYTES);
> +		ret =3D -EINVAL;
> +		goto out_netlink;
> +	}
> +
>  	ret =3D ncsi_xmit_cmd(&nca);
>  out_netlink:
>  	if (ret !=3D 0) {
> --
> 2.17.1

