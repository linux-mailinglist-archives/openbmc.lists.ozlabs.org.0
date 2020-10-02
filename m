Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4D281027
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 11:55:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2lhy19VFzDq7F
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 19:54:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.94; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=gMfFbS5d; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=gMfFbS5d; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310094.outbound.protection.outlook.com [40.107.131.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2lh23RwxzDqQd
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 19:54:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIKfWf+1zPE+WEwQ6p2pxU4uTZyEQteMw0sfSYpQHCg=;
 b=gMfFbS5datpatR7jT2q7YcrcvG5mWbp365zbjvjT7QvcpENmaysXYVDA7bjD8tM31kGpaJ0Wh70Iwy9oouUcP66qlVUkfF3c5wtawwqy66+Fa1D9JDBugPJzZrUwPo2+T+FPIvY8WZvXfu7Gq3p6qgyBBLgpas6qOKKdNdONeBk=
Received: from SLXP216CA0036.KORP216.PROD.OUTLOOK.COM (2603:1096:100:4::22) by
 HK0PR04MB3121.apcprd04.prod.outlook.com (2603:1096:203:90::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.28; Fri, 2 Oct 2020 09:54:00 +0000
Received: from PU1APC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:4:cafe::af) by SLXP216CA0036.outlook.office365.com
 (2603:1096:100:4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35 via Frontend
 Transport; Fri, 2 Oct 2020 09:54:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT055.mail.protection.outlook.com (10.152.253.106) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Fri, 2 Oct 2020 09:53:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVsFeSaGPF3o28zQbDwS4IIMCuy9WV4h9bWdcKCwOl+NVLktxn/dp8JKFg7eg743dpOmufjW2LtxCvzofVPPHWwEBqAhDIPEX4A06K7LePAzvd/PdfH3+cM9bRG6ltGoTp3HF2LOKv3C4c78YPBv6FmG20yF7FzXF+VYzTK638x5VgnumXY2HWBJMuv98I5+VsXjMXq29z27jCXMLAItyPGLwVtNys1n1U9GWLnf4a1zvrPxZ/8XwV42Q90xywP4YqAHPVc3PB3vdwPhE6ge3pSLizZnXiyidYTfx6N+qFlGAu1g4VM2AVQ1dBw67MKSrqx24joc38S+ia7CofLHYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIKfWf+1zPE+WEwQ6p2pxU4uTZyEQteMw0sfSYpQHCg=;
 b=cjn7ap79eaJcMwdZkURZKY1jcSdBhJropMENYdoR4vWIyOXdxe+JMbYBxV0Gvx9bUyr/AqlIMivXgn0W1lOi/AzNwU+qnI9Biiq/gVSo1E3K9UKt7ILIhp9H7Oc2S307A2DR1x4i7+mXBb/IovmygtyD8bETjE3IZOEBGnqRnqmuEKagodbdM7UA7oumyN9SPGotXdhm0R1JVSeba++d/0d44Wn0Gymm8TbcR20AoAz14A6PkYJ069EDRQDmrTB8T/bewVsOkm9oSklN9gLXwRB4SbBuY6vBhD4usNX8Igpvv4Vv4HeFaNdPpP950NYNO0UrvF4x0zeCGxqbYo6lIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIKfWf+1zPE+WEwQ6p2pxU4uTZyEQteMw0sfSYpQHCg=;
 b=gMfFbS5datpatR7jT2q7YcrcvG5mWbp365zbjvjT7QvcpENmaysXYVDA7bjD8tM31kGpaJ0Wh70Iwy9oouUcP66qlVUkfF3c5wtawwqy66+Fa1D9JDBugPJzZrUwPo2+T+FPIvY8WZvXfu7Gq3p6qgyBBLgpas6qOKKdNdONeBk=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2684.apcprd04.prod.outlook.com (2603:1096:4:65::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.36; Fri, 2 Oct 2020 09:53:47 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 09:53:46 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Connection issue in OpenBMC image
Thread-Topic: Connection issue in OpenBMC image
Thread-Index: AdaIK6vt31RmicRFTiOQBEztxwnvYACTHsXgAAMSy4AANSDeAAAFmmiAACmSOpAAPPsWAAAkyl4AAVXVjIABY40FgA==
Date: Fri, 2 Oct 2020 09:53:46 +0000
Message-ID: <SG2PR04MB3093211265E4BEDDA478E040E1310@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30932185827E6DCADD02F422E1240@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB3093E7C8F543D9AD318B4653E1230@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <68131600080119@mail.yandex-team.ru>
 <SG2PR04MB309303A2C979A689DE8B67CFE1200@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <18221600180837@mail.yandex-team.ru>
 <SG2PR04MB3093A564F0482CE5FF12BA42E1210@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200917154534.GI6152@heinlein>
 <SG2PR04MB30932DB1D5C88B0447DBC7F7E13F0@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB30930AE9AE508E17FB788D66E1360@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30930AE9AE508E17FB788D66E1360@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiN2JlZDBkNDYtMWE1My00NjJjLThhNWItNmY3NDM5ZWQ1NTk0IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMFBmOFFXR3lUU1wveFwvTkZzWmJuQzhXeCtXVGhPTzNidUE5VW8zRWdlWlJJT0F0cFhpRkFGMWtHYmdYVm9Na0tBIn0=
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:38a:3b6c:398d:e95f:bb0e:c328]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 98ed2af8-887b-4b1e-2fcb-08d866b915a1
x-ms-traffictypediagnostic: SG2PR04MB2684:|HK0PR04MB3121:
X-Microsoft-Antispam-PRVS: <HK0PR04MB31213BCC145C7DFFCB9AA037E1310@HK0PR04MB3121.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8B8EoZlvqpks5fqbTF3ajf+s6vRKxotpAqUljdQjVaSFS6tdSI2Z3XCuzAqm9HRZ5u+azq3QwQmuy0RHggdPtQn8Tz0VYQ7H/5VlFtMaqo9gQvDKdb9ws3u7rtt0irgDR2AoFLZ886y6RC/n/V7xaChZTXJJOcnl5m/b9ypExxJ9n/g/o944mSod/lCFZW6nNzbteYj+shhw5KdBO7WNGQVqE1POZQDWXNN1wodEsC+XG4GHCUlaeyRQbVf4KE3en02b1iaRBYhtilgVwal2gBmxkMhEOX+9YcS+OsgufkzCrE297d063wlSLDXpxqb+MdYCTqkXChiPKoFQSSnIv+4biDRyy+D8oHYrQm+/rTL/jWBNSiFgQa2XVOeGiORUkLo14isHl2r5XOEJ6FWfD9YG4fr2bP0TiMTs91xU5j/1Z6L1fo29FKzJbPreBUKH/GiWy4pet84pjEcoYAiMMw==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(186003)(4326008)(7696005)(6506007)(30864003)(966005)(54906003)(53546011)(71200400001)(316002)(86362001)(5660300002)(66946007)(66556008)(83080400001)(52536014)(478600001)(2906002)(64756008)(76116006)(66476007)(66446008)(6916009)(8936002)(9686003)(33656002)(55016002)(83380400001)(8676002)(47845001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: YbgMmjWMX7qih8oOrGuidPpOchRZWUacvrLE0ik644r7oVRL2g5ss2NfvRdkk1H4eUOilvC2JV/+GQ7esEjwpt8fJQRcruqienOfd4+Yes3L1h7HOQsrOV4O+6Zlh8c1lkfRYyQq7LKUqBcoP8aX7UVCfP9hfF202OamYek4kglTXESgryLYcjzKIQZEQeRvi5yUXApTqZLPOfc1Eo3scac9UYr9St7Kn8ph0hq3aDuKLM4NKi4y4xeI/ZanpoUmuHDSPXsOXP3i4tGGKjbFBszbkL5k7FSLNWRIxWvGLvAGLZrDd3hw8je1AeFkZyEv5jw2AJCABWI9QCMLGtDZxzQXRlf1ir/1mVmOK9+647TCNgWLadcWowtHffARUWYiU1yZwC5zE+hv3xCRjmKWmA2VwQ59n6bYPHqxaVsYHYxeBjMhEdXpPMnYk6Cvh/B2CwOzqUkeYVKwZ8Eeug5YTQVhjt2RiJtuM+y3FywNYjrmdI3KJo3RhNGJZbLuFTONOfva/sjoEUzudUOV0KsyQkc/0A7hIBI5ZCJHy7ZfsfgCk86UKCj7BhiqJ319AU/68bhrZo9HFaqhG/+6E9vW+wTkcMHekDcC2xssN2Ph0rb3OLOz2PzwfVz7vbGH0wI7UBPZKXFk/s7DeIZOzszZazovHLZktNlgIq1KUn8ZgnvdY/qc3uB8iNxdvCwA4/Je7roc4C5Q7yF6CUMd+nFWmA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2684
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 53300b60-51ee-419d-38e3-08d866b90e51
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xGwnz1yHybiJlkjRMiE8TjXFyAFZtVe9JmbLJfo0qWJM7izWt3j4HPgIZvWH35zRSrWFWTyYDfsS7udedyHOzRxIoAGQHdm0c8x4wiWz8vLZ0AvI7801N+bpUSgZDVawKOgBjbYzROaYaxr4wBH8Zm+CDdWR1PxeTiSPuGflUVBS9H0f2u89RAD71rXPAic0hkVlSMhDRZyqLI4osdXUKOvpZGap+hzf7EPdwC0KzUXqxCBcw9X4G3D1r5eDmrahA4Ni3xh6AaO9fNrNnWAYIUTFpwKNFwL/ufx6EfiFoGqlVD35uvPD60GHxPRbv8EK+ITVtJd/GWB6m0YNV/rpL1XhAeDzxPxdS9SzSeV07V8oNEoNhk8ZaWqX7bFg2PBWSP+dLgo7+8pSbER1bJIVNZizje8jqvRGCFbtGXJrKp/cnQCUTFSYzaRgshfDXudcH1Y7rusfCMY/dIWfQNj+d33CqVEu47WZsL07k0pS/AqgumXJPImeeS4qgIQqaWXb7GW51L+uUhoIozf186iGfGZgouPQPWqTcos5zFkUQi8GaaZ5uCDdOQa1+vza/ERw0VtpI4JWeB6gBAoXlPu27A==
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966005)(55016002)(9686003)(30864003)(8676002)(356005)(47076004)(33656002)(82310400003)(2906002)(8936002)(83380400001)(5660300002)(53546011)(81166007)(7696005)(82740400003)(34070700002)(52536014)(6506007)(70586007)(86362001)(36906005)(6916009)(478600001)(966005)(186003)(316002)(4326008)(26005)(54906003)(70206006)(336012)(47845001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 09:53:58.1187 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ed2af8-887b-4b1e-2fcb-08d866b915a1
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3121
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
Cc: George Keishing <gkeishin@in.ibm.com>,
 "geissonator@yahoo.com" <geissonator@yahoo.com>,
 Vijay Khemka <vijaykhemka@fb.com>,
 Konstantin Klubnichkin <kitsok@yandex-team.ru>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: HCL Internal

Regarding SSH connection, an issue has been created in openbmc and I also s=
ee others having this same issue.
From the comments, I have run "dropbear -E -p 5022" in the target (UART-con=
sole) and tried to connect the target using "ssh -p 5022 <ip>" and ssh conn=
ection established.
But, reboot and systemctl commands hangs.

Issue - https://github.com/openbmc/openbmc/issues/3701

root@tiogapass:~# dropbear -E -p 5022
[348] Jan 01 00:06:48 Failed loading /etc/dropbear/dropbear_dss_host_key
[348] Jan 01 00:06:48 Failed loading /etc/dropbear/dropbear_ecdsa_host_key
[348] Jan 01 00:06:48 Failed loading /etc/dropbear/dropbear_ed25519_host_ke=
y
[349] Jan 01 00:06:48 Running in background

[root@odc ~]# ssh -p 5022 root@10.0.128.108
root@10.0.128.108's password:
root@tiogapass:~#

Hi George,

We are facing connection issue in accessing the target after flashing the l=
atest image.
In openbmc-test-automation, whether any test cases are present in CI to ide=
ntify these issues ?
Please let us know your comments on this.

Regards,
Jayashree

-----Original Message-----
From: Jayashree D
Sent: Friday, September 25, 2020 10:29 AM
To: openbmc@lists.ozlabs.org
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>; Vijay Khemka <vijaykhem=
ka@fb.com>; geissonator@yahoo.com; joel@jms.id.au; Patrick Williams <patric=
k@stwcx.xyz>
Subject: RE: Connection issue in OpenBMC image

Classification: HCL Internal

Hi Team,

In the latest openbmc build, after image upgradation in the target, not abl=
e to connect the target through SSH but able to ping the IP Address.

After analysing the latest commits, reverted the below commit in the latest=
 build and checked by flashing the image. Now the target is connecting thro=
ugh SSH. Please help us on fixing this issue.

Commit Link - https://github.com/openbmc/openbmc/commit/635e0e4637e40ba03f6=
9204265427550fd404f4c


Observation on UART-console after flashing latest image without any changes=
:

1. reboot command is not working.
2. systemctl status <service_name> is not providing any status. ( Failed to=
 get properties: Connection timed out) 3. I tried "ssh -vvv <ip>" and logs =
are attached for working and non-working image.
4. From controller, I tried to upgrade image using redfish and image is bei=
ng copied and following logs shown.
root@tiogapass:~# journalctl | grep image Jan 01 00:00:37 tiogapass phospho=
r-image-updater[246]: Error in mapper GetSubTreePath Jan 01 10:43:59 tiogap=
ass phosphor-image-updater[246]: BMC image activating - BMC reboots are dis=
abled.

5. Using Rest API command,

[root@odc ]# curl -k -H "X-Auth-Token: $token" -H "Content-Type: applicatio=
n/json" -X PUT -d '{"data":"xyz.openbmc_project.Software.Activation.Request=
edActivations.Active"}' https://${bmc}/xyz/openbmc_project/software/a77348b=
e/attr/RequestedActivation
{
  "data": {
    "description": "org.freedesktop.DBus.Error.NoReply"
  },
  "message": "Method call timed out",
  "status": "error"
}


Regards,
Jayashree

-----Original Message-----
From: Jayashree D
Sent: Friday, September 18, 2020 3:18 PM
To: Patrick Williams <patrick@stwcx.xyz>; openbmc@lists.ozlabs.org
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Subject: RE: Connection issue in OpenBMC image

Classification: HCL Internal

Hello Patrick,

I saw the post about dropbear, but that commit was updated on July16 and my=
 target is connecting till August last week image. I don't think that will =
be an issue. Also on working image, I tried with 'ssh -vvv ' and I got belo=
w information.

OpenSSH_7.4p1, OpenSSL 1.0.2k-fips  26 Jan 2017
debug1: Reading configuration data /etc/ssh/ssh_config
debug1: /etc/ssh/ssh_config line 58: Applying options for *
debug2: resolving "10.0.128.108" port 22
debug2: ssh_connect_direct: needpriv 0
debug1: Connecting to 10.0.128.108 [10.0.128.108] port 22.
debug1: Connection established.
debug1: permanently_set_uid: 0/0
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_rsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_rsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_dsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_dsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_ecdsa type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_ecdsa-cert type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_ed25519 type -1
debug1: key_load_public: No such file or directory
debug1: identity file /root/.ssh/id_ed25519-cert type -1
debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_7.4
debug1: Remote protocol version 2.0, remote software version dropbear_2020.=
80
debug1: no match: dropbear_2020.80
debug2: fd 3 setting O_NONBLOCK
debug1: Authenticating to 10.0.128.108:22 as 'root'
debug3: hostkeys_foreach: reading file "/root/.ssh/known_hosts"
debug3: record_hostkey: found key type RSA in file /root/.ssh/known_hosts:6=
8
debug3: load_hostkeys: loaded 1 keys from 10.0.128.108
debug3: order_hostkeyalgs: prefer hostkeyalgs: ssh-rsa-cert-v01@openssh.com=
,rsa-sha2-512,rsa-sha2-256,ssh-rsa
debug3: send packet: type 20
debug1: SSH2_MSG_KEXINIT sent
debug3: receive packet: type 20
debug1: SSH2_MSG_KEXINIT received
debug2: local client KEXINIT proposal
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh=
-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-e=
xchange-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,=
diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha256,diffie-hel=
lman-group14-sha1,diffie-hellman-group1-sha1,ext-info-c
debug2: host key algorithms: ssh-rsa-cert-v01@openssh.com,rsa-sha2-512,rsa-=
sha2-256,ssh-rsa,ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp3=
84-cert-v01@openssh.com,ecdsa-sha2-nistp521-cert-v01@openssh.com,ssh-ed2551=
9-cert-v01@openssh.com,ssh-dss-cert-v01@openssh.com,ecdsa-sha2-nistp256,ecd=
sa-sha2-nistp384,ecdsa-sha2-nistp521,ssh-ed25519,ssh-dss
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,a=
es256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-c=
bc,aes256-cbc
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes192-ctr,a=
es256-ctr,aes128-gcm@openssh.com,aes256-gcm@openssh.com,aes128-cbc,aes192-c=
bc,aes256-cbc
debug2: MACs ctos: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sh=
a2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.=
com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hm=
ac-sha1
debug2: MACs stoc: umac-64-etm@openssh.com,umac-128-etm@openssh.com,hmac-sh=
a2-256-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha1-etm@openssh.=
com,umac-64@openssh.com,umac-128@openssh.com,hmac-sha2-256,hmac-sha2-512,hm=
ac-sha1
debug2: compression ctos: none,zlib@openssh.com,zlib
debug2: compression stoc: none,zlib@openssh.com,zlib
debug2: languages ctos:
debug2: languages stoc:
debug2: first_kex_follows 0
debug2: reserved 0
debug2: peer server KEXINIT proposal
debug2: KEX algorithms: curve25519-sha256,curve25519-sha256@libssh.org,ecdh=
-sha2-nistp521,ecdh-sha2-nistp384,ecdh-sha2-nistp256,diffie-hellman-group14=
-sha256,kexguess2@matt.ucc.asn.au
debug2: host key algorithms: rsa-sha2-256,ssh-rsa
debug2: ciphers ctos: chacha20-poly1305@openssh.com,aes128-ctr,aes256-ctr
debug2: ciphers stoc: chacha20-poly1305@openssh.com,aes128-ctr,aes256-ctr
debug2: MACs ctos: hmac-sha1,hmac-sha2-256
debug2: MACs stoc: hmac-sha1,hmac-sha2-256
debug2: compression ctos: zlib@openssh.com,none
debug2: compression stoc: zlib@openssh.com,none
debug2: languages ctos:
debug2: languages stoc:
debug2: first_kex_follows 0
debug2: reserved 0
debug1: kex: algorithm: curve25519-sha256
debug1: kex: host key algorithm: rsa-sha2-256
debug1: kex: server->client cipher: chacha20-poly1305@openssh.com MAC: <imp=
licit> compression: none
debug1: kex: client->server cipher: chacha20-poly1305@openssh.com MAC: <imp=
licit> compression: none
debug1: kex: curve25519-sha256 need=3D64 dh_need=3D64
debug1: kex: curve25519-sha256 need=3D64 dh_need=3D64
debug3: send packet: type 30
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug3: receive packet: type 31
debug1: Server host key: ssh-rsa SHA256:3WwhPmIIxzrw0+cm/0vN3hifY4kh9sJhClV=
Nw6zrJ7Y
debug3: hostkeys_foreach: reading file "/root/.ssh/known_hosts"
debug3: record_hostkey: found key type RSA in file /root/.ssh/known_hosts:6=
8
debug3: load_hostkeys: loaded 1 keys from 10.0.128.108
debug1: Host '10.0.128.108' is known and matches the RSA host key.
debug1: Found key in /root/.ssh/known_hosts:68
debug3: send packet: type 21
debug2: set_newkeys: mode 1
debug1: rekey after 134217728 blocks
debug1: SSH2_MSG_NEWKEYS sent
debug1: expecting SSH2_MSG_NEWKEYS
debug3: receive packet: type 21
debug1: SSH2_MSG_NEWKEYS received
debug2: set_newkeys: mode 0
debug1: rekey after 134217728 blocks
debug2: key: /root/.ssh/id_rsa (0x558ea3ad3640), agent
debug2: key: /root/.ssh/id_rsa ((nil))
debug2: key: /root/.ssh/id_dsa ((nil))
debug2: key: /root/.ssh/id_ecdsa ((nil))
debug2: key: /root/.ssh/id_ed25519 ((nil))
debug3: send packet: type 5
debug3: receive packet: type 7
debug1: SSH2_MSG_EXT_INFO received
debug1: kex_input_ext_info: server-sig-algs=3D<ssh-ed25519,ecdsa-sha2-nistp=
256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,rsa-sha2-256,ssh-rsa,ssh-dss>
debug3: receive packet: type 6
debug2: service_accept: ssh-userauth
debug1: SSH2_MSG_SERVICE_ACCEPT received
debug3: send packet: type 50
debug3: receive packet: type 51
debug1: Authentications that can continue: publickey,password
debug3: start over, passed a different list publickey,password
debug3: preferred gssapi-keyex,gssapi-with-mic,publickey,keyboard-interacti=
ve,password
debug3: authmethod_lookup publickey
debug3: remaining preferred: keyboard-interactive,password
debug3: authmethod_is_enabled publickey
debug1: Next authentication method: publickey
debug1: Offering RSA public key: /root/.ssh/id_rsa
debug3: send_pubkey_test
debug3: send packet: type 50
debug2: we sent a publickey packet, wait for reply
debug3: receive packet: type 51
debug1: Authentications that can continue: publickey,password
debug1: Trying private key: /root/.ssh/id_rsa
debug3: sign_and_send_pubkey: RSA SHA256:YfteufmWUV8W7EQEycZ+38skgUWGDTYFHw=
93a7SwwLM
debug3: send packet: type 50
debug2: we sent a publickey packet, wait for reply
debug3: receive packet: type 51
debug1: Authentications that can continue: publickey,password
debug1: Trying private key: /root/.ssh/id_dsa
debug3: no such identity: /root/.ssh/id_dsa: No such file or directory
debug1: Trying private key: /root/.ssh/id_ecdsa
debug3: no such identity: /root/.ssh/id_ecdsa: No such file or directory
debug1: Trying private key: /root/.ssh/id_ed25519
debug3: no such identity: /root/.ssh/id_ed25519: No such file or directory
debug2: we did not send a packet, disable method
debug3: authmethod_lookup password
debug3: remaining preferred: ,password
debug3: authmethod_is_enabled password
debug1: Next authentication method: password


In non-working image, the logs are stopped after below lines and it is not =
providing any errors.

debug1: Enabling compatibility mode for protocol 2.0
debug1: Local version string SSH-2.0-OpenSSH_7.4

Also one more observation in UART-Console, after flashing latest image.

1. reboot command is not working.
2. systemctl status <service_name> is not providing any status. ( Failed to=
 get properties: Connection timed out) 3. I can able to ping the ip address=
 but scp is not working.

Thanks,
Jayashree


-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>
Sent: Thursday, September 17, 2020 9:16 PM
To: Jayashree D <jayashree-d@hcl.com>
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>; openbmc@lists.ozlabs.or=
g
Subject: Re: Connection issue in OpenBMC image

Hello Jayashree,

I saw an output `ssh -v` from you earlier, but there really wasn't any usef=
ul information there.  It looked like the connection was being made and key=
s were exchanged and then the log just stopped abruptly.  This tells me it =
likely isn't a networking issue but an issue in the handshake between the s=
sh-client (your computer) and ssh-server (dropbear).  You can continue to a=
dd '-v' parameters up to `ssh -vvv` and you'll get increasingly more inform=
ation.

Joseph Reynolds recently posted a reminder about dropbear disabling weak ci=
phers[1].  Is it possible that your client is using an old cipher?

On Wed, Sep 16, 2020 at 11:35:28AM +0000, Jayashree D wrote:
> root@tiogapass:~# journalctl | grep drop
...
> Jan 01 00:15:28 tiogapass systemd[1]: dropbear@0-10.0.128.108:22-10.0.0.1=
:51810.service: Succeeded.
> Jan 01 00:15:44 tiogapass dropbear[2753]: Child connection from
> ::ffff:10.0.0.1:51944 Jan 01 00:15:50 tiogapass dropbear[2753]: PAM
> password auth succeeded for 'root' from ::ffff:10.0.0.1:51944

This looks like a valid connection was established.

> 15.09.2020, 16:12, "Jayashree D" <jayashree-d@hcl.com<mailto:jayashree-d@=
hcl.com>>:
>
> OpenSSH_7.4p1, OpenSSL 1.0.2k-fips  26 Jan 2017
> debug1: Reading configuration data /etc/ssh/ssh_config
> debug1: /etc/ssh/ssh_config line 58: Applying options for *
> debug1: Connecting to 10.0.128.108 [10.0.128.108] port 22.
> debug1: Connection established.
> debug1: permanently_set_uid: 0/0
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_rsa type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_rsa-cert type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_dsa type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_dsa-cert type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ecdsa type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ecdsa-cert type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ed25519 type -1
> debug1: key_load_public: No such file or directory
> debug1: identity file /root/.ssh/id_ed25519-cert type -1
> debug1: Enabling compatibility mode for protocol 2.0
> debug1: Local version string SSH-2.0-OpenSSH_7.4

This is the log that also looks like a good connection.  Identity files wer=
e attempted to be exchanged.  Version strings were exchanged.  And then the=
 log just abruptly stops.  Was the connection dropped?  Is it hung?

1. https://lists.ozlabs.org/pipermail/openbmc/2020-September/023071.html

--
Patrick Williams
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________
