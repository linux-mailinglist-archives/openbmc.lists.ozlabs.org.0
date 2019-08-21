Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6539D98690
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 23:25:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DLLH5rrqzDqym
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 07:25:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=148.163.137.20; helo=mx0b-00154904.pphosted.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="NP8pW7K/"; 
 dkim-atps=neutral
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com
 [148.163.137.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DLKX3kf5zDqy9
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 07:25:01 +1000 (AEST)
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
 by mx0b-00154904.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LLADEn006795
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 17:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com;
 h=from : to : subject :
 date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=IW/4zYgD443tA89Wg+OoQ6xbIDSw8ToEd3ox1kivyl0=;
 b=NP8pW7K/UxhctC6VMfomtSLM2BVipafYSy8jg4itOTNjbbItaxTKAgQtp4DxUgwzmlBR
 B9VZHKw+FkdGNCheKzDo2+FuWy9NnrIPVpmvwkP8JuTByI4+Yj/4l7EvpsHACNnNZapE
 GekCPUF3q4zNXHE9TFuCjSbQApi1zS4WsdGCmHPwUshBk/q5k/3B2/U2YohU/bZuThID
 jR5QFtPsQbxTCTmkKcLFfaFWmLql5AHdPXAdPopbBtexy2RH/RthY8fAmJi+ZCBMWQiA
 Rfj2WaRAdi/hajA1jePtHdVJXcmZfGDNNSeG3NWX3YDx6YqoOMElmokWl7B0KOVmiMQe 2w== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com
 [67.231.149.39])
 by mx0b-00154904.pphosted.com with ESMTP id 2ugh3g80p4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 17:24:56 -0400
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
 by mx0a-00154901.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7LLCwR9048590
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 17:24:55 -0400
Received: from ausxippc106.us.dell.com (AUSXIPPC106.us.dell.com
 [143.166.85.156])
 by mx0a-00154901.pphosted.com with ESMTP id 2uh91uvjhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 17:24:55 -0400
X-LoopCount0: from 10.166.135.94
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.60,349,1549951200"; d="scan'208";a="450686217"
From: <Justin.Lee1@Dell.com>
To: <netdev@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-kernel@vger.kernel.org>, <sam@mendozajonas.com>,
 <davem@davemloft.net>
Subject: [PATCH] net/ncsi: Fix the payload copying for the request coming from
 Netlink
Thread-Topic: [PATCH] net/ncsi: Fix the payload copying for the request coming
 from Netlink
Thread-Index: AdVYWI8OU3qkqsD+SsWDRcEtUwk7KQ==
Date: Wed, 21 Aug 2019 21:24:52 +0000
Message-ID: <a94e5fa397a64ae3a676ec11ea09aaba@AUSX13MPS302.AMER.DELL.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Justin_Lee1@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2019-08-21T21:22:10.9472431Z;
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
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=669 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210208
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=825 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908210208
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The request coming from Netlink should use the OEM generic handler.

The standard command handler expects payload in bytes/words/dwords
but the actual payload is stored in data if the request is coming from Netl=
ink.

Signed-off-by: Justin Lee <justin.lee1@dell.com>

---
 net/ncsi/ncsi-cmd.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
index eab4346..0187e65 100644
--- a/net/ncsi/ncsi-cmd.c
+++ b/net/ncsi/ncsi-cmd.c
@@ -309,14 +309,21 @@ static struct ncsi_request *ncsi_alloc_command(struct=
 ncsi_cmd_arg *nca)
=20
 int ncsi_xmit_cmd(struct ncsi_cmd_arg *nca)
 {
+	struct ncsi_cmd_handler *nch =3D NULL;
 	struct ncsi_request *nr;
+	unsigned char type;
 	struct ethhdr *eh;
-	struct ncsi_cmd_handler *nch =3D NULL;
 	int i, ret;
=20
+	/* Use OEM generic handler for Netlink request */
+	if (nca->req_flags =3D=3D NCSI_REQ_FLAG_NETLINK_DRIVEN)
+		type =3D NCSI_PKT_CMD_OEM;
+	else
+		type =3D nca->type;
+
 	/* Search for the handler */
 	for (i =3D 0; i < ARRAY_SIZE(ncsi_cmd_handlers); i++) {
-		if (ncsi_cmd_handlers[i].type =3D=3D nca->type) {
+		if (ncsi_cmd_handlers[i].type =3D=3D type) {
 			if (ncsi_cmd_handlers[i].handler)
 				nch =3D &ncsi_cmd_handlers[i];
 			else
--=20
2.9.3
