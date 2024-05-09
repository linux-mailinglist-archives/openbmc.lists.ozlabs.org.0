Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDA88C18C9
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2024 23:57:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=Sp2cCel2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb5Ty613Jz3dSv
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2024 07:57:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=smartm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=Sp2cCel2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=smartm.com (client-ip=2a01:111:f403:2415::701; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=rajesh.ananth@smartm.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb5TN6rglz3cll
	for <openbmc@lists.ozlabs.org>; Fri, 10 May 2024 07:57:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbGXqpux3Vp9Q2g0Ul1Wfu4zlF/HBIufkpGD3u/PklAoUxWlJ8X37I436SGStgBNmodgRiyXBqFpc5TV3pipScw/WAQYAreiqBgJXLeiqSjKW2g7v1CyV1S0m8C3T4waboLl+4HLds3rmYLJonuMHawoB1C39i9LfI2MVwvtqDqBgMib5NyuOZUBN46TrZofjHgXQe1ToiQhGP/djaRPPh86oQoZ9iNIPz/Cn8J9ifrR0u3Le7FgQz+SQcBJHTCFiE+2TARH9Z4SjS4DYgK7KpuhQOoG1wr2VEhJnFAiEiTkunkKnUgpVyjitl7+ouOy6KY/u1Vu6e3wUHW1zJC0EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tfbx/xMPJNmyoH5VnKTsDnAXcnB62B0mk3/qJkg2io=;
 b=YBdhfkAL4Wyzr8ViY2ujPYsTPrbgjTkg0idpJk9vTx6q91cmhQEeXzHFZ5VGoxMMrl90/iUX6357dF/l+OVZ7sK0ROwCMmo3CVqAVetBO1jy2e5/n+qGox0Hsr4fBC65hd6TTpqnxyPxhVsgWs03p1Jzwd5UweVHBjNFXYcbGPfhQ4XEQLks2R6jbVk1dP27qIos2CRc2b2dVKQNC2bmej9i/NlORj3TGFmgNVZu+ql5dnMs+b66tOBK5f6cXZoBAsEDpIYhz7M1E7EycgZjg7s9gO48df9so5kLMI7yOHi6ShkrS1qA6bHuV+z8FnGtLJJQNJNKUsbYTF3HK+p4Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartm.com; dmarc=pass action=none header.from=smartm.com;
 dkim=pass header.d=smartm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smartm.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tfbx/xMPJNmyoH5VnKTsDnAXcnB62B0mk3/qJkg2io=;
 b=Sp2cCel21/dFRJdjpLCZJLJpmGc15KazTIQmxz7AbEUvFzHBWZJ9VIW6s9NIyzAOiaoJG7ADjnbcypub2ZTKzo2Xze9i6KqBgZXfvf7WeZ12egiHgQCPRuelUtWkxIMEfm+wDuFDoOhg07Pudrp85JvwrcscnHGw0c+sjOsQyd4C3IsyOmLge0FwOYEBSUPS0AsF0CQoadWazkQp5niOQPX1VoKj7JHFhFXQDBsnzNwvx4199IqaX9yV924t5dkBT33coJbTcJQLsPp6YA3zKo0nSfTZUnT0+Wj3Ubkz6SOWnCU58zeVjEfP+mRClrV3vW1GL7hSbvVlON25WYsExA==
Received: from BN8PR04MB5906.namprd04.prod.outlook.com (2603:10b6:408:a7::27)
 by SJ0PR04MB7374.namprd04.prod.outlook.com (2603:10b6:a03:290::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 21:56:51 +0000
Received: from BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3]) by BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3%7]) with mapi id 15.20.7544.046; Thu, 9 May 2024
 21:56:50 +0000
From: "Ananth, Rajesh" <rajesh.ananth@smartm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Information about CXL
Thread-Topic: Information about CXL
Thread-Index: AdqiWnejFO5u456nQym13RaU1NRCOA==
Date: Thu, 9 May 2024 21:56:50 +0000
Message-ID:  <BN8PR04MB5906892BD5B7DD9A26AEB15594E62@BN8PR04MB5906.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR04MB5906:EE_|SJ0PR04MB7374:EE_
x-ms-office365-filtering-correlation-id: d6a242da-38e3-45fd-e8d7-08dc7072ee80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:  =?us-ascii?Q?GTRF65QvD1b3zOx8tKvaKW238V1TzE5bSDUA/pbwDQGRS3i6i2TX0Nx41xfL?=
 =?us-ascii?Q?7i8bgDH3GArtRAP5VLpmK8LzDxzX5LDSGg+KH3BjDMIMkaOpES+MQWYTaYbZ?=
 =?us-ascii?Q?4gHyiyoCa3XQN3dcs1rA5Wd/YJRXEE80HvAdHbRX0Pj8M1Jr8ZZjjPyjjCJt?=
 =?us-ascii?Q?LYHNHMjt/ZA/4gTEMXNWAbJZJyprQwuYKVjRLYS15eZSSC0xhh72B3nTFhE1?=
 =?us-ascii?Q?ipu9+tzAOJdHe2hssZbe8+syfO7vI/T6WYG/2TW1ohU01GQ9sf09LHF5HO6j?=
 =?us-ascii?Q?alui213n+aZ55giQgPXA0YAwCg/Q5vEZns1iz41bKHLoAedwzzF9xL2EdRZR?=
 =?us-ascii?Q?2YUSZuMc8hyjtSYWTX/S7Vb3h2MThD28goICD2xCnRi6+TA/Z8uTNs8vFwJK?=
 =?us-ascii?Q?DqJM5gATHLrXLY0rikkrzYTYuZnmU+dUjIzZjpV3FhSEDJb3IQXP+HG5zNMj?=
 =?us-ascii?Q?IyQE6r2Rdp8qCEALBzcwZu47VRsK3JTEemmu2Rx4cLi243hNNBVGSgWT6k2/?=
 =?us-ascii?Q?Br7e4iT9Cx4ivt0UISt/77UvShMwhi78EC9XC7GiPn+7StbK0m8UCs5SYcv0?=
 =?us-ascii?Q?EnxLdAjR8J82eV57dwe5G0gyJs6/z2yaisrA4DjMj/mwdSr5HAMZBve43CsD?=
 =?us-ascii?Q?Nk4mi/jISjUCB5yha7mvBymoL/Du4UJcbClZhVrumro7Yv/yvkbBrMgiqwje?=
 =?us-ascii?Q?nc2yjadsC84jWcgJ+1Yd+2vclbKJX7KV1+BeAZoIhuYMQ1/c/oo0e5zWCYLm?=
 =?us-ascii?Q?5Wao68m42jHfw0GC+IiRFH/s6UULOyzt/4gs8kNReNQgkbG9xrRcExWp4XzM?=
 =?us-ascii?Q?iKdUXCsFWDTcsfVq6SwPLDnkSqm/ymfDWpQpMfNVEDz3d3FkhR3s2ueN6eJ3?=
 =?us-ascii?Q?nBDVp3EjGLojJkZnnBpS4rwZdAEJdw9PctxQUZIRs2o/PvcD/du/KaDHXTpX?=
 =?us-ascii?Q?JgibhBAE1cr1Qrit07s/xbsFbLzhUy6hx5xxyiB9WF9V5glLlNwgeGDuWlSg?=
 =?us-ascii?Q?bIC82i8+DYDpO/oLr0rano7FEHG8nGdqqn3Obmo+e3CyWxqoDlr8SncbCw86?=
 =?us-ascii?Q?1Db+XL00ltUvVUB3aDhdKpvWWfarPL6ZaIwX6BtbOYkQekmTKXM0TPJ0FW2g?=
 =?us-ascii?Q?QmD+wSN0+iq0GTmaersRz1442ZK0JPbv/Z36uUuQNJ0uR+yk8WC02PNe8cDp?=
 =?us-ascii?Q?hL79zHdCbQCvlu1haIbNBHQEvNz5SjCN5p40l1sT5U+Aa4nU3q9ZOCRqTugk?=
 =?us-ascii?Q?mKnvO/fc0FAwEK0HFk+4N2A2hypQn1wRJqu9FmO4jUrba0l63xupQS7+x7uh?=
 =?us-ascii?Q?CHmh41inzrxFdSdUPJ+MYeNQCtS3nYXi/GDMQqxApJaNBg=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR04MB5906.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?vh/FDqU3vL7XC1wRQz+meNgm+RfMV3tffz353RVDLdd44Qtbdd7l3ahc7tGR?=
 =?us-ascii?Q?FDb73LyJfXp13WwnPn2urnBiUXJA11otMUpFUeitcm4odqB8NpRTFcI7VgOg?=
 =?us-ascii?Q?SKNUNOhUjSKNX25bSHqX7L8Ns4o0V7bC4594vFzmArbOeHgCEunvV9ChrzZQ?=
 =?us-ascii?Q?hPu8QRVYFhfCfX9DTG3JN0WANxOYUlVWaqnLE+ev/O/IVKzstqbaKmNVIO4J?=
 =?us-ascii?Q?L8awbZlBKDQC9N36DzH4bk5CEXVrnNjuysc9mVK4xwTviHnOz9PAvwqRmnwL?=
 =?us-ascii?Q?RPZd2xewy6h74jVePlAdtExCjdsqazJWwiCFQlaCQXVxUy3CpJ74qLaqGXrQ?=
 =?us-ascii?Q?Z4GXU09hvrKN1/wl4kNgpai9eJOULqZzXc9uEujkxg5Q6SZKsDtNXp2S6ya7?=
 =?us-ascii?Q?yGfbLpYoCDb2QK49XLhaMH0Qdhr+FLOQv1v7bep0QDGmGedl1uQqpT1zL4IM?=
 =?us-ascii?Q?toghMcvfPnGKhBnPRzp+j0Eu4VyJGFyckMtlpDQgx6Uy3wvDsDm0zp2kwvpX?=
 =?us-ascii?Q?0LpIanPW+BVlrH60jOg00lqkSwNQTZk+JCQEgo10L7HjJ0rj+18uPFu7QCYG?=
 =?us-ascii?Q?H/CtmOCxuKUwcdnenstPm1zAoVo32FMBrZczhDuX3caCLbJeKr1GQdN1a5rc?=
 =?us-ascii?Q?h7yxeldz73AM/ZpJjxZn2eqjhPKo7tol9uH/5S2qfQ1OVgue1dpftJjoEvsA?=
 =?us-ascii?Q?c2FBuXJa6AUd2zSZWnw6uD9n17FYrJWFuDtshbPeKZaZQi4SUmnkyDmoFl3z?=
 =?us-ascii?Q?puobPhKMU40PV7pk757C//j4//Mt7kqIfZTcF7+P2x2h187MtIeoRxTffHfB?=
 =?us-ascii?Q?FXRhLj6qZ/9R6rQ5RSrfpMX13WrX/roefpeTf+Iv2jo473EAgGvu2yoei3Ve?=
 =?us-ascii?Q?a7QV9/6YOD+9zNOzl5hejrXSJD8H6xS5DPbnuW/mMfTwOFHecoaoO3HzOePC?=
 =?us-ascii?Q?3Eo61uBrCI/jRo67QuE2adxiII+7B7dZCqAZxyal8honZvEtYIe6xHoeYEka?=
 =?us-ascii?Q?0P4HplCfSI53VljqBFLP2IS3dDPmlif1EZ/ln8tFwRuAFAHuplldZY/JjAhT?=
 =?us-ascii?Q?la+x6dFIs0SG4PBp2AOBN4bOA/dbUQvp+rPj31shrSd1/kDYbS9lJGh2fkYF?=
 =?us-ascii?Q?PHpexjG8C55txDmqRLOnF1jSj07kZ/if0OEmjwsgOpZAmgIKOs6QIl2Jugz6?=
 =?us-ascii?Q?itWqbB+TwtZaLc/UUjPPPvtWvQ/wTf/C1K487AVVBlst09XnJRZFK3NPQU0A?=
 =?us-ascii?Q?N4wtcQ/EhQqrmTYy/kU1h6qZM5Qm9Lb60rQfZkNnDTnSiuNKw2LTCaNFECJE?=
 =?us-ascii?Q?9EXBXBdAMG4p0/CBWTbPB4Lxrje7MA8rs0CVTKKVxidEgsoLjRblb4dcI2Ls?=
 =?us-ascii?Q?iJnLlFSMjvIn+ovXRnrrG8VWNa876XSHE+5awh7NMCuWatMOc5eZANX/NkCY?=
 =?us-ascii?Q?Y8xvFfAKNF1feLG+T7zQ9RgvKpngcGm3gW5S0mrOJJQYuWbDZLQUpArUsWDa?=
 =?us-ascii?Q?T6QVLpefbz/Mt2o9yBmX4WD50YwRQGw3V8IsToAzOWoNEW8jAihJzeIKrEvu?=
 =?us-ascii?Q?wpzLAQbbCAR8cicXabFB8K4oFJc9nS6MaiF9DHBJ?=
Content-Type: multipart/alternative;
	boundary="_000_BN8PR04MB5906892BD5B7DD9A26AEB15594E62BN8PR04MB5906namp_"
MIME-Version: 1.0
X-OriginatorOrg: smartm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR04MB5906.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6a242da-38e3-45fd-e8d7-08dc7072ee80
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 21:56:50.9703
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0fd7909-cd13-4779-b0f9-5ced6b7a2c68
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ScloVS8c4ZWUrufeUzyH7aSn4YiyWYbxRRAht95onLPuSOD5k3qIbtv5gqbnkiWgZYXewtivJ4m6yA0F9URAQk7dI0sZJOieUMTf5/G5jVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7374
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

--_000_BN8PR04MB5906892BD5B7DD9A26AEB15594E62BN8PR04MB5906namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

We are in the process of developing OpenBMC based firmware update mechanism=
 for the PCI-e based CXL controllers. The CXL controllers typically expose =
their interfaces as a memory mapped mailbox in the PCI-e space.

Basic things we are looking forward to implement are (depends on the feasib=
ility here):

1.       Probe the PCI-e config space to locate our controller  (using PCI =
VID/DID)

2.       Probe the PCI-e config space to access the memory mapped registers

3.       Use the mapped registers to send commands and update the firmware

We would like to have some pointers on how to proceed (sample code/developm=
ent docs etc.,). We are initially targeting s2600wf board as our target.

Thanks,
Rajesh



--_000_BN8PR04MB5906892BD5B7DD9A26AEB15594E62BN8PR04MB5906namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1570190475;
	mso-list-type:hybrid;
	mso-list-template-ids:-961640274 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are in the process of developing OpenBMC based fi=
rmware update mechanism for the PCI-e based CXL controllers. The CXL contro=
llers typically expose their interfaces as a memory mapped mailbox in the P=
CI-e space.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Basic things we are looking forward to implement are=
 (depends on the feasibility here):<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">1.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Probe the PCI-e config space to locate our controll=
er&nbsp; (using PCI VID/DID)<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">2.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Probe the PCI-e config space to access the memory m=
apped registers<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"mso-list:Ignore">3.<span style=
=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><![endif]>Use the mapped registers to send commands and updat=
e the firmware<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We would like to have some pointers on how to procee=
d (sample code/development docs etc.,). We are initially targeting s2600wf =
board as our target.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<br>
Rajesh<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN8PR04MB5906892BD5B7DD9A26AEB15594E62BN8PR04MB5906namp_--
