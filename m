Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E57277FD0
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 07:14:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ByKpB6zSBzDqn1
	for <lists+openbmc@lfdr.de>; Fri, 25 Sep 2020 15:14:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.129.98; helo=kor01-sl2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=nA28fPRt; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=nA28fPRt; 
 dkim-atps=neutral
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-eopbgr1290098.outbound.protection.outlook.com [40.107.129.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ByKTj2dbtzDqLs
 for <openbmc@lists.ozlabs.org>; Fri, 25 Sep 2020 14:59:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKPj3EafJOO3p+IFGwq0CepCr/l1g2F3Z8spkgbSavo=;
 b=nA28fPRtVufmBWC+DHF1z0aWayYbTGR3kN57mk2B0j/eGbRpu9WeRxd2eggdXQ+OfIawy22HQ+Bl2sNEXp29WyBhJ9EUMxyMOHdfwd5xvslCZKLUC50rs0YohLfXLeIzY9ES1KTqGGSNbEMITunToYQmhCi2ANYHuY8YxANadOI=
Received: from HK2PR02CA0213.apcprd02.prod.outlook.com (2603:1096:201:20::25)
 by SL2PR04MB3273.apcprd04.prod.outlook.com (2603:1096:100:34::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Fri, 25 Sep
 2020 04:59:34 +0000
Received: from HK2APC01FT047.eop-APC01.prod.protection.outlook.com
 (2603:1096:201:20:cafe::dc) by HK2PR02CA0213.outlook.office365.com
 (2603:1096:201:20::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend
 Transport; Fri, 25 Sep 2020 04:59:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.51) by
 HK2APC01FT047.mail.protection.outlook.com (10.152.249.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.21 via Frontend Transport; Fri, 25 Sep 2020 04:59:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9YbD0pb98TGkjBomiJaXcSFLohRG9eDactnMm4lrnyffK7Ere2/0SCKOIyzp2ycqSysJuMGfEi4eqQvWJ4bju84zQAI3MfVFt5q2m5EQGJGWgWUP+lIeoKJhoZaaVjNwrMksCl3vayJLHDjR6ZQ7sq9k8tbcAvXn+8SM7vjPCUL0po1PiEBVVwTpIoEWsiC/npmUye7HHJV73PPaGFeF1Cx4SmwGpQblOeBQc5h+x3lgCi8FNZimuvWJ8uDfIaT14BdsivRlA6Ji3NjgTGcLMGGYquBTKuhEVHamk9lI3FvYF3FmCye4q6DC21ebPaiSAwBL1I7yfRYpzw6q86L1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKPj3EafJOO3p+IFGwq0CepCr/l1g2F3Z8spkgbSavo=;
 b=YrjEBDPxoVnAOcXVsKYCKEqfV8gWs7+hKRKtVVW+KQvo3Oqxf3StGZh3DZVelkoFQAyLzMWmIpisZrRZYzYr4E5zmlxdqW7hNA4eYKAItA/r9X+gmJfHh+AjEHB+ZF0+6MemnRU3Ua1tVPJJ6tO8Q8nWTuThcIKP32I4dxwYB1mF4eKi4AL5Q5/A+En/VgrFb0XFXkMsXQbdUR6tDBFMQlUEk4BcyE0783OgwxshCoQleCFaDINokjQAiZXQxHr5OLC/1iSNkGQZ8O0mAAz4M4ImTYUbi3u12/Mpiyoe3DJxnk5wdTbyjuCrgvA+NwOIS0TyAogUiV7JaWoBVxRM1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKPj3EafJOO3p+IFGwq0CepCr/l1g2F3Z8spkgbSavo=;
 b=nA28fPRtVufmBWC+DHF1z0aWayYbTGR3kN57mk2B0j/eGbRpu9WeRxd2eggdXQ+OfIawy22HQ+Bl2sNEXp29WyBhJ9EUMxyMOHdfwd5xvslCZKLUC50rs0YohLfXLeIzY9ES1KTqGGSNbEMITunToYQmhCi2ANYHuY8YxANadOI=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR0401MB2080.apcprd04.prod.outlook.com (2603:1096:3:5::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.24; Fri, 25 Sep 2020 04:59:26 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3391.027; Fri, 25 Sep 2020
 04:59:26 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Connection issue in OpenBMC image
Thread-Topic: Connection issue in OpenBMC image
Thread-Index: AdaIK6vt31RmicRFTiOQBEztxwnvYACTHsXgAAMSy4AANSDeAAAFmmiAACmSOpAAPPsWAAAkyl4AAVXVjIA=
Date: Fri, 25 Sep 2020 04:59:25 +0000
Message-ID: <SG2PR04MB30930AE9AE508E17FB788D66E1360@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30932185827E6DCADD02F422E1240@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB3093E7C8F543D9AD318B4653E1230@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <68131600080119@mail.yandex-team.ru>
 <SG2PR04MB309303A2C979A689DE8B67CFE1200@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <18221600180837@mail.yandex-team.ru>
 <SG2PR04MB3093A564F0482CE5FF12BA42E1210@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200917154534.GI6152@heinlein>
 <SG2PR04MB30932DB1D5C88B0447DBC7F7E13F0@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30932DB1D5C88B0447DBC7F7E13F0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiN2JlZDBkNDYtMWE1My00NjJjLThhNWItNmY3NDM5ZWQ1NTk0IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMFBmOFFXR3lUU1wveFwvTkZzWmJuQzhXeCtXVGhPTzNidUE5VW8zRWdlWlJJT0F0cFhpRkFGMWtHYmdYVm9Na0tBIn0=
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:38a:3b6c:8004:1ed4:6269:7a0c]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 25609efc-dfaf-4fd8-98da-08d8610fcac4
x-ms-traffictypediagnostic: SG2PR0401MB2080:|SL2PR04MB3273:
X-Microsoft-Antispam-PRVS: <SL2PR04MB3273348BAAE3B257CDE05704E1360@SL2PR04MB3273.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Jbt2h49YUadhcarS6eRhC/kF8kB0EGEAumFjKV6pkKfW7Z3x/CNEL8mmD4N/NzIugO3t+ere7keqpMngIJ05gqOS9L78yukBIgj/qChY2Avu/7AxK3+d7N1fNiFTxi2+jjVuLM+mo9aALxx5vlvsL7b7AI3p6wxo9mxEU5ivJsUytDgUdDAIdvGmsQAkho1pMZRaMf/cV/B2lK2Jt1dvG+5omiPywR1TcZeEhfoZhpLYEwg0MNfg6SvDADUAhOiqibipOy6E4xlL/2IHRYOQqKg0xY/O/JvwlU7eGPXPvkbzCt9lcuM+RWIlWRqIhPFtFQd4l9pp7OEQ+m5CP9x9aeFf3PxHywiWapfIAvX7SMq2cIwtaf9N9FXQVaKTzc0Xr6+1K7uAc4ggHgBj6P14NA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(53546011)(6506007)(7696005)(186003)(6916009)(33656002)(316002)(54906003)(83380400001)(9686003)(478600001)(4326008)(55016002)(86362001)(5660300002)(30864003)(2906002)(66446008)(52536014)(66476007)(66556008)(64756008)(966005)(8936002)(8676002)(71200400001)(76116006)(99936003)(66946007)(66616009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: c4SEwmXyqLnVYPPwnXIE5SBkJwdkwqwHFt/7U4tXzDEo34Mzv5g4pJh/YsmTVLXdlS+qFt3pJ0xtOWVcsNAOkW0h7Su+RdS8D/ibsL28gVQw9DiK2bXiSLEORqgnJMpEipXyvaHzi5GalZ1VPRBtJ02KMuuCqq5gjxVUjDoQD4ay7nVF0JtkXMdJQv/8/J0M3cohyspidGvzTbTtEqPGHjrxu6GZPU3G1O3JJPt2MgSLkHfZ+ZMNL52XI3tqjlkKOgA404WFV8r7gK+9u/3nu2SW5BxgdJWpWsrbVP9S+Ht6HfDYkHozrGHR1AQzIi2/Mo4MD0N11of2E1BA+4sOeJhvdz7q8pBRfVzNm/IzmbaCy74DJLOsgo38wRca5R/N4SJE88CYvcGA+Aeiw1n3gd92kSINSg99VOk+IPjqnW9CcRWetBOzb7EH+NfNefR/4aOth3bWClerFsfz0qoTPnOvZMWUsyr1Jk7E/v+knnVWLm8q3pEizf857GWnG6dkyXRU/UPMXw88O98w6K+eWSrqq8L6Og6gBAz3XDMsFL/jRV4xsvZWHtMvUeTni3KLHpQM83OBtFBCyPFhXj/77VmIIF/1TpxyNLAmGNLxbbrr2EfHWS5yU3oa6LWogtBTl0odE9ALfzJe2FK9p2ykP4dogUE8pdAVxthvBRVAwi61xCb6M3Vy8djk61vP6BXstp1tQsl4Eiu+2Xw7+oPjqQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_002_SG2PR04MB30930AE9AE508E17FB788D66E1360SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR0401MB2080
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT047.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7c88e68b-79f9-48a2-a1a0-08d8610fc6e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96gnWQ5Eg95GT2yf+e4q8FWB2REVRTOMBv9xlwxLzbIpJVnRwcvUd9H4kK9Md+1vP/rwsBfCVNCHRk0q9j2/XdM/9vM9LbuGGtQ0UqMY2e+vYuEu+mXMLJkCbnYEkCeBKrRVqpuQIS3VmwCt+GlOmXgjJEhtlTposj84OfHztcs3XhBSbHtGmC8vKVXn+5qmL9efEe3sJHdy2I1RV6UmBtv4oRV04qwXOiMvV5UpoQHU1IpVp91tIKIqBZiBCi3UZ8zvJY6O61smyAE30uGbT1nuWlYl6wcThRxft8Brvrq7TBG9kIlJgYVXpugdEBRlZa02iXOYAfbLMCXJGolhTmxiV7YK6Lag7B9QFElIMAuR8rH1N93dY/a3G/Pssyd3jwSfyens4d7u4A65ECh0lgEpqytX9LKcGfFhhX5n7nvt7pgKtYYgBHy1N+P7SZCRTCiex6FPCLvjFdfrWT7D0WUB2P8+xu2qG+J2mxelTAOpwGdsQxSeiFi/kZo01Qv1
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(4326008)(47076004)(53546011)(336012)(478600001)(186003)(86362001)(99936003)(7696005)(966005)(82740400003)(356005)(9686003)(21480400003)(34020700004)(83380400001)(82310400003)(26005)(81166007)(52536014)(30864003)(316002)(6506007)(235185007)(36906005)(70586007)(55016002)(70206006)(2906002)(8676002)(5660300002)(33656002)(8936002)(54906003)(6916009)(66616009);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 04:59:31.4126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25609efc-dfaf-4fd8-98da-08d8610fcac4
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT047.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3273
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
Cc: "geissonator@yahoo.com" <geissonator@yahoo.com>,
 Vijay Khemka <vijaykhemka@fb.com>,
 Konstantin Klubnichkin <kitsok@yandex-team.ru>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_002_SG2PR04MB30930AE9AE508E17FB788D66E1360SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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
 get properties: Connection timed out)
3. I tried "ssh -vvv <ip>" and logs are attached for working and non-workin=
g image.
4. From controller, I tried to upgrade image using redfish and image is bei=
ng copied and following logs shown.
root@tiogapass:~# journalctl | grep image
Jan 01 00:00:37 tiogapass phosphor-image-updater[246]: Error in mapper GetS=
ubTreePath
Jan 01 10:43:59 tiogapass phosphor-image-updater[246]: BMC image activating=
 - BMC reboots are disabled.

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

--_002_SG2PR04MB30930AE9AE508E17FB788D66E1360SG2PR04MB3093apcp_
Content-Type: text/plain; name="ssh_connection.txt"
Content-Description: ssh_connection.txt
Content-Disposition: attachment; filename="ssh_connection.txt"; size=10871;
	creation-date="Tue, 22 Sep 2020 16:06:14 GMT";
	modification-date="Tue, 22 Sep 2020 16:06:15 GMT"
Content-Transfer-Encoding: base64

DQpXb3JraW5nIGxvZ3M6DQoNCk9wZW5TU0hfNy40cDEsIE9wZW5TU0wgMS4wLjJrLWZpcHMgIDI2
IEphbiAyMDE3DQpkZWJ1ZzE6IFJlYWRpbmcgY29uZmlndXJhdGlvbiBkYXRhIC9ldGMvc3NoL3Nz
aF9jb25maWcNCmRlYnVnMTogL2V0Yy9zc2gvc3NoX2NvbmZpZyBsaW5lIDU4OiBBcHBseWluZyBv
cHRpb25zIGZvciAqDQpkZWJ1ZzI6IHJlc29sdmluZyAiMTAuMC4xMjguMTA4IiBwb3J0IDIyDQpk
ZWJ1ZzI6IHNzaF9jb25uZWN0X2RpcmVjdDogbmVlZHByaXYgMA0KZGVidWcxOiBDb25uZWN0aW5n
IHRvIDEwLjAuMTI4LjEwOCBbMTAuMC4xMjguMTA4XSBwb3J0IDIyLg0KZGVidWcxOiBDb25uZWN0
aW9uIGVzdGFibGlzaGVkLg0KZGVidWcxOiBwZXJtYW5lbnRseV9zZXRfdWlkOiAwLzANCmRlYnVn
MToga2V5X2xvYWRfcHVibGljOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQpkZWJ1ZzE6IGlk
ZW50aXR5IGZpbGUgL3Jvb3QvLnNzaC9pZF9yc2EgdHlwZSAtMQ0KZGVidWcxOiBrZXlfbG9hZF9w
dWJsaWM6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCmRlYnVnMTogaWRlbnRpdHkgZmlsZSAv
cm9vdC8uc3NoL2lkX3JzYS1jZXJ0IHR5cGUgLTENCmRlYnVnMToga2V5X2xvYWRfcHVibGljOiBO
byBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQpkZWJ1ZzE6IGlkZW50aXR5IGZpbGUgL3Jvb3QvLnNz
aC9pZF9kc2EgdHlwZSAtMQ0KZGVidWcxOiBrZXlfbG9hZF9wdWJsaWM6IE5vIHN1Y2ggZmlsZSBv
ciBkaXJlY3RvcnkNCmRlYnVnMTogaWRlbnRpdHkgZmlsZSAvcm9vdC8uc3NoL2lkX2RzYS1jZXJ0
IHR5cGUgLTENCmRlYnVnMToga2V5X2xvYWRfcHVibGljOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0
b3J5DQpkZWJ1ZzE6IGlkZW50aXR5IGZpbGUgL3Jvb3QvLnNzaC9pZF9lY2RzYSB0eXBlIC0xDQpk
ZWJ1ZzE6IGtleV9sb2FkX3B1YmxpYzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KZGVidWcx
OiBpZGVudGl0eSBmaWxlIC9yb290Ly5zc2gvaWRfZWNkc2EtY2VydCB0eXBlIC0xDQpkZWJ1ZzE6
IGtleV9sb2FkX3B1YmxpYzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KZGVidWcxOiBpZGVu
dGl0eSBmaWxlIC9yb290Ly5zc2gvaWRfZWQyNTUxOSB0eXBlIC0xDQpkZWJ1ZzE6IGtleV9sb2Fk
X3B1YmxpYzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KZGVidWcxOiBpZGVudGl0eSBmaWxl
IC9yb290Ly5zc2gvaWRfZWQyNTUxOS1jZXJ0IHR5cGUgLTENCmRlYnVnMTogRW5hYmxpbmcgY29t
cGF0aWJpbGl0eSBtb2RlIGZvciBwcm90b2NvbCAyLjANCmRlYnVnMTogTG9jYWwgdmVyc2lvbiBz
dHJpbmcgU1NILTIuMC1PcGVuU1NIXzcuNA0KZGVidWcxOiBSZW1vdGUgcHJvdG9jb2wgdmVyc2lv
biAyLjAsIHJlbW90ZSBzb2Z0d2FyZSB2ZXJzaW9uIGRyb3BiZWFyXzIwMjAuODANCmRlYnVnMTog
bm8gbWF0Y2g6IGRyb3BiZWFyXzIwMjAuODANCmRlYnVnMjogZmQgMyBzZXR0aW5nIE9fTk9OQkxP
Q0sNCmRlYnVnMTogQXV0aGVudGljYXRpbmcgdG8gMTAuMC4xMjguMTA4OjIyIGFzICdyb290Jw0K
ZGVidWczOiBob3N0a2V5c19mb3JlYWNoOiByZWFkaW5nIGZpbGUgIi9yb290Ly5zc2gva25vd25f
aG9zdHMiDQpkZWJ1ZzM6IHJlY29yZF9ob3N0a2V5OiBmb3VuZCBrZXkgdHlwZSBSU0EgaW4gZmls
ZSAvcm9vdC8uc3NoL2tub3duX2hvc3RzOjY4DQpkZWJ1ZzM6IGxvYWRfaG9zdGtleXM6IGxvYWRl
ZCAxIGtleXMgZnJvbSAxMC4wLjEyOC4xMDgNCmRlYnVnMzogb3JkZXJfaG9zdGtleWFsZ3M6IHBy
ZWZlciBob3N0a2V5YWxnczogc3NoLXJzYS1jZXJ0LXYwMUBvcGVuc3NoLmNvbSxyc2Etc2hhMi01
MTIscnNhLXNoYTItMjU2LHNzaC1yc2ENCmRlYnVnMzogc2VuZCBwYWNrZXQ6IHR5cGUgMjANCmRl
YnVnMTogU1NIMl9NU0dfS0VYSU5JVCBzZW50DQpkZWJ1ZzM6IHJlY2VpdmUgcGFja2V0OiB0eXBl
IDIwDQpkZWJ1ZzE6IFNTSDJfTVNHX0tFWElOSVQgcmVjZWl2ZWQNCmRlYnVnMjogbG9jYWwgY2xp
ZW50IEtFWElOSVQgcHJvcG9zYWwNCmRlYnVnMjogS0VYIGFsZ29yaXRobXM6IGN1cnZlMjU1MTkt
c2hhMjU2LGN1cnZlMjU1MTktc2hhMjU2QGxpYnNzaC5vcmcsZWNkaC1zaGEyLW5pc3RwMjU2LGVj
ZGgtc2hhMi1uaXN0cDM4NCxlY2RoLXNoYTItbmlzdHA1MjEsZGlmZmllLWhlbGxtYW4tZ3JvdXAt
ZXhjaGFuZ2Utc2hhMjU2LGRpZmZpZS1oZWxsbWFuLWdyb3VwMTYtc2hhNTEyLGRpZmZpZS1oZWxs
bWFuLWdyb3VwMTgtc2hhNTEyLGRpZmZpZS1oZWxsbWFuLWdyb3VwLWV4Y2hhbmdlLXNoYTEsZGlm
ZmllLWhlbGxtYW4tZ3JvdXAxNC1zaGEyNTYsZGlmZmllLWhlbGxtYW4tZ3JvdXAxNC1zaGExLGRp
ZmZpZS1oZWxsbWFuLWdyb3VwMS1zaGExLGV4dC1pbmZvLWMNCmRlYnVnMjogaG9zdCBrZXkgYWxn
b3JpdGhtczogc3NoLXJzYS1jZXJ0LXYwMUBvcGVuc3NoLmNvbSxyc2Etc2hhMi01MTIscnNhLXNo
YTItMjU2LHNzaC1yc2EsZWNkc2Etc2hhMi1uaXN0cDI1Ni1jZXJ0LXYwMUBvcGVuc3NoLmNvbSxl
Y2RzYS1zaGEyLW5pc3RwMzg0LWNlcnQtdjAxQG9wZW5zc2guY29tLGVjZHNhLXNoYTItbmlzdHA1
MjEtY2VydC12MDFAb3BlbnNzaC5jb20sc3NoLWVkMjU1MTktY2VydC12MDFAb3BlbnNzaC5jb20s
c3NoLWRzcy1jZXJ0LXYwMUBvcGVuc3NoLmNvbSxlY2RzYS1zaGEyLW5pc3RwMjU2LGVjZHNhLXNo
YTItbmlzdHAzODQsZWNkc2Etc2hhMi1uaXN0cDUyMSxzc2gtZWQyNTUxOSxzc2gtZHNzDQpkZWJ1
ZzI6IGNpcGhlcnMgY3RvczogY2hhY2hhMjAtcG9seTEzMDVAb3BlbnNzaC5jb20sYWVzMTI4LWN0
cixhZXMxOTItY3RyLGFlczI1Ni1jdHIsYWVzMTI4LWdjbUBvcGVuc3NoLmNvbSxhZXMyNTYtZ2Nt
QG9wZW5zc2guY29tLGFlczEyOC1jYmMsYWVzMTkyLWNiYyxhZXMyNTYtY2JjDQpkZWJ1ZzI6IGNp
cGhlcnMgc3RvYzogY2hhY2hhMjAtcG9seTEzMDVAb3BlbnNzaC5jb20sYWVzMTI4LWN0cixhZXMx
OTItY3RyLGFlczI1Ni1jdHIsYWVzMTI4LWdjbUBvcGVuc3NoLmNvbSxhZXMyNTYtZ2NtQG9wZW5z
c2guY29tLGFlczEyOC1jYmMsYWVzMTkyLWNiYyxhZXMyNTYtY2JjDQpkZWJ1ZzI6IE1BQ3MgY3Rv
czogdW1hYy02NC1ldG1Ab3BlbnNzaC5jb20sdW1hYy0xMjgtZXRtQG9wZW5zc2guY29tLGhtYWMt
c2hhMi0yNTYtZXRtQG9wZW5zc2guY29tLGhtYWMtc2hhMi01MTItZXRtQG9wZW5zc2guY29tLGht
YWMtc2hhMS1ldG1Ab3BlbnNzaC5jb20sdW1hYy02NEBvcGVuc3NoLmNvbSx1bWFjLTEyOEBvcGVu
c3NoLmNvbSxobWFjLXNoYTItMjU2LGhtYWMtc2hhMi01MTIsaG1hYy1zaGExDQpkZWJ1ZzI6IE1B
Q3Mgc3RvYzogdW1hYy02NC1ldG1Ab3BlbnNzaC5jb20sdW1hYy0xMjgtZXRtQG9wZW5zc2guY29t
LGhtYWMtc2hhMi0yNTYtZXRtQG9wZW5zc2guY29tLGhtYWMtc2hhMi01MTItZXRtQG9wZW5zc2gu
Y29tLGhtYWMtc2hhMS1ldG1Ab3BlbnNzaC5jb20sdW1hYy02NEBvcGVuc3NoLmNvbSx1bWFjLTEy
OEBvcGVuc3NoLmNvbSxobWFjLXNoYTItMjU2LGhtYWMtc2hhMi01MTIsaG1hYy1zaGExDQpkZWJ1
ZzI6IGNvbXByZXNzaW9uIGN0b3M6IG5vbmUsemxpYkBvcGVuc3NoLmNvbSx6bGliDQpkZWJ1ZzI6
IGNvbXByZXNzaW9uIHN0b2M6IG5vbmUsemxpYkBvcGVuc3NoLmNvbSx6bGliDQpkZWJ1ZzI6IGxh
bmd1YWdlcyBjdG9zOiANCmRlYnVnMjogbGFuZ3VhZ2VzIHN0b2M6IA0KZGVidWcyOiBmaXJzdF9r
ZXhfZm9sbG93cyAwDQpkZWJ1ZzI6IHJlc2VydmVkIDANCmRlYnVnMjogcGVlciBzZXJ2ZXIgS0VY
SU5JVCBwcm9wb3NhbA0KZGVidWcyOiBLRVggYWxnb3JpdGhtczogY3VydmUyNTUxOS1zaGEyNTYs
Y3VydmUyNTUxOS1zaGEyNTZAbGlic3NoLm9yZyxlY2RoLXNoYTItbmlzdHA1MjEsZWNkaC1zaGEy
LW5pc3RwMzg0LGVjZGgtc2hhMi1uaXN0cDI1NixkaWZmaWUtaGVsbG1hbi1ncm91cDE0LXNoYTI1
NixrZXhndWVzczJAbWF0dC51Y2MuYXNuLmF1DQpkZWJ1ZzI6IGhvc3Qga2V5IGFsZ29yaXRobXM6
IHJzYS1zaGEyLTI1Nixzc2gtcnNhDQpkZWJ1ZzI6IGNpcGhlcnMgY3RvczogY2hhY2hhMjAtcG9s
eTEzMDVAb3BlbnNzaC5jb20sYWVzMTI4LWN0cixhZXMyNTYtY3RyDQpkZWJ1ZzI6IGNpcGhlcnMg
c3RvYzogY2hhY2hhMjAtcG9seTEzMDVAb3BlbnNzaC5jb20sYWVzMTI4LWN0cixhZXMyNTYtY3Ry
DQpkZWJ1ZzI6IE1BQ3MgY3RvczogaG1hYy1zaGExLGhtYWMtc2hhMi0yNTYNCmRlYnVnMjogTUFD
cyBzdG9jOiBobWFjLXNoYTEsaG1hYy1zaGEyLTI1Ng0KZGVidWcyOiBjb21wcmVzc2lvbiBjdG9z
OiB6bGliQG9wZW5zc2guY29tLG5vbmUNCmRlYnVnMjogY29tcHJlc3Npb24gc3RvYzogemxpYkBv
cGVuc3NoLmNvbSxub25lDQpkZWJ1ZzI6IGxhbmd1YWdlcyBjdG9zOiANCmRlYnVnMjogbGFuZ3Vh
Z2VzIHN0b2M6IA0KZGVidWcyOiBmaXJzdF9rZXhfZm9sbG93cyAwDQpkZWJ1ZzI6IHJlc2VydmVk
IDANCmRlYnVnMToga2V4OiBhbGdvcml0aG06IGN1cnZlMjU1MTktc2hhMjU2DQpkZWJ1ZzE6IGtl
eDogaG9zdCBrZXkgYWxnb3JpdGhtOiByc2Etc2hhMi0yNTYNCmRlYnVnMToga2V4OiBzZXJ2ZXIt
PmNsaWVudCBjaXBoZXI6IGNoYWNoYTIwLXBvbHkxMzA1QG9wZW5zc2guY29tIE1BQzogPGltcGxp
Y2l0PiBjb21wcmVzc2lvbjogbm9uZQ0KZGVidWcxOiBrZXg6IGNsaWVudC0+c2VydmVyIGNpcGhl
cjogY2hhY2hhMjAtcG9seTEzMDVAb3BlbnNzaC5jb20gTUFDOiA8aW1wbGljaXQ+IGNvbXByZXNz
aW9uOiBub25lDQpkZWJ1ZzE6IGtleDogY3VydmUyNTUxOS1zaGEyNTYgbmVlZD02NCBkaF9uZWVk
PTY0DQpkZWJ1ZzE6IGtleDogY3VydmUyNTUxOS1zaGEyNTYgbmVlZD02NCBkaF9uZWVkPTY0DQpk
ZWJ1ZzM6IHNlbmQgcGFja2V0OiB0eXBlIDMwDQpkZWJ1ZzE6IGV4cGVjdGluZyBTU0gyX01TR19L
RVhfRUNESF9SRVBMWQ0KZGVidWczOiByZWNlaXZlIHBhY2tldDogdHlwZSAzMQ0KZGVidWcxOiBT
ZXJ2ZXIgaG9zdCBrZXk6IHNzaC1yc2EgU0hBMjU2OjNXd2hQbUlJeHpydzArY20vMHZOM2hpZlk0
a2g5c0poQ2xWTnc2enJKN1kNCmRlYnVnMzogaG9zdGtleXNfZm9yZWFjaDogcmVhZGluZyBmaWxl
ICIvcm9vdC8uc3NoL2tub3duX2hvc3RzIg0KZGVidWczOiByZWNvcmRfaG9zdGtleTogZm91bmQg
a2V5IHR5cGUgUlNBIGluIGZpbGUgL3Jvb3QvLnNzaC9rbm93bl9ob3N0czo2OA0KZGVidWczOiBs
b2FkX2hvc3RrZXlzOiBsb2FkZWQgMSBrZXlzIGZyb20gMTAuMC4xMjguMTA4DQpkZWJ1ZzE6IEhv
c3QgJzEwLjAuMTI4LjEwOCcgaXMga25vd24gYW5kIG1hdGNoZXMgdGhlIFJTQSBob3N0IGtleS4N
CmRlYnVnMTogRm91bmQga2V5IGluIC9yb290Ly5zc2gva25vd25faG9zdHM6NjgNCmRlYnVnMzog
c2VuZCBwYWNrZXQ6IHR5cGUgMjENCmRlYnVnMjogc2V0X25ld2tleXM6IG1vZGUgMQ0KZGVidWcx
OiByZWtleSBhZnRlciAxMzQyMTc3MjggYmxvY2tzDQpkZWJ1ZzE6IFNTSDJfTVNHX05FV0tFWVMg
c2VudA0KZGVidWcxOiBleHBlY3RpbmcgU1NIMl9NU0dfTkVXS0VZUw0KZGVidWczOiByZWNlaXZl
IHBhY2tldDogdHlwZSAyMQ0KZGVidWcxOiBTU0gyX01TR19ORVdLRVlTIHJlY2VpdmVkDQpkZWJ1
ZzI6IHNldF9uZXdrZXlzOiBtb2RlIDANCmRlYnVnMTogcmVrZXkgYWZ0ZXIgMTM0MjE3NzI4IGJs
b2Nrcw0KZGVidWcyOiBrZXk6IC9yb290Ly5zc2gvaWRfcnNhICgweDU1OGVhM2FkMzY0MCksIGFn
ZW50DQpkZWJ1ZzI6IGtleTogL3Jvb3QvLnNzaC9pZF9yc2EgKChuaWwpKQ0KZGVidWcyOiBrZXk6
IC9yb290Ly5zc2gvaWRfZHNhICgobmlsKSkNCmRlYnVnMjoga2V5OiAvcm9vdC8uc3NoL2lkX2Vj
ZHNhICgobmlsKSkNCmRlYnVnMjoga2V5OiAvcm9vdC8uc3NoL2lkX2VkMjU1MTkgKChuaWwpKQ0K
ZGVidWczOiBzZW5kIHBhY2tldDogdHlwZSA1DQpkZWJ1ZzM6IHJlY2VpdmUgcGFja2V0OiB0eXBl
IDcNCmRlYnVnMTogU1NIMl9NU0dfRVhUX0lORk8gcmVjZWl2ZWQNCmRlYnVnMToga2V4X2lucHV0
X2V4dF9pbmZvOiBzZXJ2ZXItc2lnLWFsZ3M9PHNzaC1lZDI1NTE5LGVjZHNhLXNoYTItbmlzdHAy
NTYsZWNkc2Etc2hhMi1uaXN0cDM4NCxlY2RzYS1zaGEyLW5pc3RwNTIxLHJzYS1zaGEyLTI1Nixz
c2gtcnNhLHNzaC1kc3M+DQpkZWJ1ZzM6IHJlY2VpdmUgcGFja2V0OiB0eXBlIDYNCmRlYnVnMjog
c2VydmljZV9hY2NlcHQ6IHNzaC11c2VyYXV0aA0KZGVidWcxOiBTU0gyX01TR19TRVJWSUNFX0FD
Q0VQVCByZWNlaXZlZA0KZGVidWczOiBzZW5kIHBhY2tldDogdHlwZSA1MA0KZGVidWczOiByZWNl
aXZlIHBhY2tldDogdHlwZSA1MQ0KZGVidWcxOiBBdXRoZW50aWNhdGlvbnMgdGhhdCBjYW4gY29u
dGludWU6IHB1YmxpY2tleSxwYXNzd29yZA0KZGVidWczOiBzdGFydCBvdmVyLCBwYXNzZWQgYSBk
aWZmZXJlbnQgbGlzdCBwdWJsaWNrZXkscGFzc3dvcmQNCmRlYnVnMzogcHJlZmVycmVkIGdzc2Fw
aS1rZXlleCxnc3NhcGktd2l0aC1taWMscHVibGlja2V5LGtleWJvYXJkLWludGVyYWN0aXZlLHBh
c3N3b3JkDQpkZWJ1ZzM6IGF1dGhtZXRob2RfbG9va3VwIHB1YmxpY2tleQ0KZGVidWczOiByZW1h
aW5pbmcgcHJlZmVycmVkOiBrZXlib2FyZC1pbnRlcmFjdGl2ZSxwYXNzd29yZA0KZGVidWczOiBh
dXRobWV0aG9kX2lzX2VuYWJsZWQgcHVibGlja2V5DQpkZWJ1ZzE6IE5leHQgYXV0aGVudGljYXRp
b24gbWV0aG9kOiBwdWJsaWNrZXkNCmRlYnVnMTogT2ZmZXJpbmcgUlNBIHB1YmxpYyBrZXk6IC9y
b290Ly5zc2gvaWRfcnNhDQpkZWJ1ZzM6IHNlbmRfcHVia2V5X3Rlc3QNCmRlYnVnMzogc2VuZCBw
YWNrZXQ6IHR5cGUgNTANCmRlYnVnMjogd2Ugc2VudCBhIHB1YmxpY2tleSBwYWNrZXQsIHdhaXQg
Zm9yIHJlcGx5DQpkZWJ1ZzM6IHJlY2VpdmUgcGFja2V0OiB0eXBlIDUxDQpkZWJ1ZzE6IEF1dGhl
bnRpY2F0aW9ucyB0aGF0IGNhbiBjb250aW51ZTogcHVibGlja2V5LHBhc3N3b3JkDQpkZWJ1ZzE6
IFRyeWluZyBwcml2YXRlIGtleTogL3Jvb3QvLnNzaC9pZF9yc2ENCmRlYnVnMzogc2lnbl9hbmRf
c2VuZF9wdWJrZXk6IFJTQSBTSEEyNTY6WWZ0ZXVmbVdVVjhXN0VRRXljWiszOHNrZ1VXR0RUWUZI
dzkzYTdTd3dMTQ0KZGVidWczOiBzZW5kIHBhY2tldDogdHlwZSA1MA0KZGVidWcyOiB3ZSBzZW50
IGEgcHVibGlja2V5IHBhY2tldCwgd2FpdCBmb3IgcmVwbHkNCmRlYnVnMzogcmVjZWl2ZSBwYWNr
ZXQ6IHR5cGUgNTENCmRlYnVnMTogQXV0aGVudGljYXRpb25zIHRoYXQgY2FuIGNvbnRpbnVlOiBw
dWJsaWNrZXkscGFzc3dvcmQNCmRlYnVnMTogVHJ5aW5nIHByaXZhdGUga2V5OiAvcm9vdC8uc3No
L2lkX2RzYQ0KZGVidWczOiBubyBzdWNoIGlkZW50aXR5OiAvcm9vdC8uc3NoL2lkX2RzYTogTm8g
c3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KZGVidWcxOiBUcnlpbmcgcHJpdmF0ZSBrZXk6IC9yb290
Ly5zc2gvaWRfZWNkc2ENCmRlYnVnMzogbm8gc3VjaCBpZGVudGl0eTogL3Jvb3QvLnNzaC9pZF9l
Y2RzYTogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KZGVidWcxOiBUcnlpbmcgcHJpdmF0ZSBr
ZXk6IC9yb290Ly5zc2gvaWRfZWQyNTUxOQ0KZGVidWczOiBubyBzdWNoIGlkZW50aXR5OiAvcm9v
dC8uc3NoL2lkX2VkMjU1MTk6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCmRlYnVnMjogd2Ug
ZGlkIG5vdCBzZW5kIGEgcGFja2V0LCBkaXNhYmxlIG1ldGhvZA0KZGVidWczOiBhdXRobWV0aG9k
X2xvb2t1cCBwYXNzd29yZA0KZGVidWczOiByZW1haW5pbmcgcHJlZmVycmVkOiAscGFzc3dvcmQN
CmRlYnVnMzogYXV0aG1ldGhvZF9pc19lbmFibGVkIHBhc3N3b3JkDQpkZWJ1ZzE6IE5leHQgYXV0
aGVudGljYXRpb24gbWV0aG9kOiBwYXNzd29yZA0KDQoNCk5vbiB3b3JraW5nIGxvZ3M6DQoNCk9w
ZW5TU0hfOC4wcDEsIE9wZW5TU0wgMS4xLjFjIEZJUFMgIDI4IE1heSAyMDE5DQpkZWJ1ZzE6IFJl
YWRpbmcgY29uZmlndXJhdGlvbiBkYXRhIC9ldGMvc3NoL3NzaF9jb25maWcNCmRlYnVnMTogL2V0
Yy9zc2gvc3NoX2NvbmZpZyBsaW5lIDIwOiBBcHBseWluZyBvcHRpb25zIGZvciAqDQpkZWJ1ZzM6
IC9ldGMvc3NoL3NzaF9jb25maWcgbGluZSA1MTogSW5jbHVkaW5nIGZpbGUgL2V0Yy9zc2gvc3No
X2NvbmZpZy5kLzA1LXJlZGhhdC5jb25mIGRlcHRoIDANCmRlYnVnMTogUmVhZGluZyBjb25maWd1
cmF0aW9uIGRhdGEgL2V0Yy9zc2gvc3NoX2NvbmZpZy5kLzA1LXJlZGhhdC5jb25mDQpkZWJ1ZzI6
IGNoZWNraW5nIG1hdGNoIGZvciAnZmluYWwgYWxsJyBob3N0IDEwLjAuMTI4LjEwOCBvcmlnaW5h
bGx5IDEwLjAuMTI4LjEwOA0KZGVidWczOiAvZXRjL3NzaC9zc2hfY29uZmlnLmQvMDUtcmVkaGF0
LmNvbmYgbGluZSAzOiBub3QgbWF0Y2hlZCAnZmluYWwnDQpkZWJ1ZzI6IG1hdGNoIG5vdCBmb3Vu
ZA0KZGVidWczOiAvZXRjL3NzaC9zc2hfY29uZmlnLmQvMDUtcmVkaGF0LmNvbmYgbGluZSA1OiBJ
bmNsdWRpbmcgZmlsZSAvZXRjL2NyeXB0by1wb2xpY2llcy9iYWNrLWVuZHMvb3BlbnNzaC5jb25m
aWcgZGVwdGggMSAocGFyc2Ugb25seSkNCmRlYnVnMTogUmVhZGluZyBjb25maWd1cmF0aW9uIGRh
dGEgL2V0Yy9jcnlwdG8tcG9saWNpZXMvYmFjay1lbmRzL29wZW5zc2guY29uZmlnDQpkZWJ1ZzM6
IGdzcyBrZXggbmFtZXMgb2s6IFtnc3MtZ2V4LXNoYTEtLGdzcy1ncm91cDE0LXNoYTEtXQ0KZGVi
dWczOiBrZXggbmFtZXMgb2s6IFtjdXJ2ZTI1NTE5LXNoYTI1NixjdXJ2ZTI1NTE5LXNoYTI1NkBs
aWJzc2gub3JnLGVjZGgtc2hhMi1uaXN0cDI1NixlY2RoLXNoYTItbmlzdHAzODQsZWNkaC1zaGEy
LW5pc3RwNTIxLGRpZmZpZS1oZWxsbWFuLWdyb3VwLWV4Y2hhbmdlLXNoYTI1NixkaWZmaWUtaGVs
bG1hbi1ncm91cDE0LXNoYTI1NixkaWZmaWUtaGVsbG1hbi1ncm91cDE2LXNoYTUxMixkaWZmaWUt
aGVsbG1hbi1ncm91cDE4LXNoYTUxMixkaWZmaWUtaGVsbG1hbi1ncm91cC1leGNoYW5nZS1zaGEx
LGRpZmZpZS1oZWxsbWFuLWdyb3VwMTQtc2hhMV0NCmRlYnVnMTogY29uZmlndXJhdGlvbiByZXF1
ZXN0cyBmaW5hbCBNYXRjaCBwYXNzDQpkZWJ1ZzI6IHJlc29sdmVfY2Fub25pY2FsaXplOiBob3N0
bmFtZSAxMC4wLjEyOC4xMDggaXMgYWRkcmVzcw0KZGVidWcxOiByZS1wYXJzaW5nIGNvbmZpZ3Vy
YXRpb24NCmRlYnVnMTogUmVhZGluZyBjb25maWd1cmF0aW9uIGRhdGEgL2V0Yy9zc2gvc3NoX2Nv
bmZpZw0KZGVidWcxOiAvZXRjL3NzaC9zc2hfY29uZmlnIGxpbmUgMjA6IEFwcGx5aW5nIG9wdGlv
bnMgZm9yICoNCmRlYnVnMzogL2V0Yy9zc2gvc3NoX2NvbmZpZyBsaW5lIDUxOiBJbmNsdWRpbmcg
ZmlsZSAvZXRjL3NzaC9zc2hfY29uZmlnLmQvMDUtcmVkaGF0LmNvbmYgZGVwdGggMA0KZGVidWcx
OiBSZWFkaW5nIGNvbmZpZ3VyYXRpb24gZGF0YSAvZXRjL3NzaC9zc2hfY29uZmlnLmQvMDUtcmVk
aGF0LmNvbmYNCmRlYnVnMjogY2hlY2tpbmcgbWF0Y2ggZm9yICdmaW5hbCBhbGwnIGhvc3QgMTAu
MC4xMjguMTA4IG9yaWdpbmFsbHkgMTAuMC4xMjguMTA4DQpkZWJ1ZzM6IC9ldGMvc3NoL3NzaF9j
b25maWcuZC8wNS1yZWRoYXQuY29uZiBsaW5lIDM6IG1hdGNoZWQgJ2ZpbmFsJw0KZGVidWcyOiBt
YXRjaCBmb3VuZA0KZGVidWczOiAvZXRjL3NzaC9zc2hfY29uZmlnLmQvMDUtcmVkaGF0LmNvbmYg
bGluZSA1OiBJbmNsdWRpbmcgZmlsZSAvZXRjL2NyeXB0by1wb2xpY2llcy9iYWNrLWVuZHMvb3Bl
bnNzaC5jb25maWcgZGVwdGggMQ0KZGVidWcxOiBSZWFkaW5nIGNvbmZpZ3VyYXRpb24gZGF0YSAv
ZXRjL2NyeXB0by1wb2xpY2llcy9iYWNrLWVuZHMvb3BlbnNzaC5jb25maWcNCmRlYnVnMzogZ3Nz
IGtleCBuYW1lcyBvazogW2dzcy1nZXgtc2hhMS0sZ3NzLWdyb3VwMTQtc2hhMS1dDQpkZWJ1ZzM6
IGtleCBuYW1lcyBvazogW2N1cnZlMjU1MTktc2hhMjU2LGN1cnZlMjU1MTktc2hhMjU2QGxpYnNz
aC5vcmcsZWNkaC1zaGEyLW5pc3RwMjU2LGVjZGgtc2hhMi1uaXN0cDM4NCxlY2RoLXNoYTItbmlz
dHA1MjEsZGlmZmllLWhlbGxtYW4tZ3JvdXAtZXhjaGFuZ2Utc2hhMjU2LGRpZmZpZS1oZWxsbWFu
LWdyb3VwMTQtc2hhMjU2LGRpZmZpZS1oZWxsbWFuLWdyb3VwMTYtc2hhNTEyLGRpZmZpZS1oZWxs
bWFuLWdyb3VwMTgtc2hhNTEyLGRpZmZpZS1oZWxsbWFuLWdyb3VwLWV4Y2hhbmdlLXNoYTEsZGlm
ZmllLWhlbGxtYW4tZ3JvdXAxNC1zaGExXQ0KZGVidWcyOiBzc2hfY29ubmVjdF9kaXJlY3QNCmRl
YnVnMTogQ29ubmVjdGluZyB0byAxMC4wLjEyOC4xMDggWzEwLjAuMTI4LjEwOF0gcG9ydCAyMi4N
CmRlYnVnMTogQ29ubmVjdGlvbiBlc3RhYmxpc2hlZC4NCmRlYnVnMTogaWRlbnRpdHkgZmlsZSAv
cm9vdC8uc3NoL2lkX3JzYSB0eXBlIC0xDQpkZWJ1ZzE6IGlkZW50aXR5IGZpbGUgL3Jvb3QvLnNz
aC9pZF9yc2EtY2VydCB0eXBlIC0xDQpkZWJ1ZzE6IGlkZW50aXR5IGZpbGUgL3Jvb3QvLnNzaC9p
ZF9kc2EgdHlwZSAtMQ0KZGVidWcxOiBpZGVudGl0eSBmaWxlIC9yb290Ly5zc2gvaWRfZHNhLWNl
cnQgdHlwZSAtMQ0KZGVidWcxOiBpZGVudGl0eSBmaWxlIC9yb290Ly5zc2gvaWRfZWNkc2EgdHlw
ZSAtMQ0KZGVidWcxOiBpZGVudGl0eSBmaWxlIC9yb290Ly5zc2gvaWRfZWNkc2EtY2VydCB0eXBl
IC0xDQpkZWJ1ZzE6IGlkZW50aXR5IGZpbGUgL3Jvb3QvLnNzaC9pZF9lZDI1NTE5IHR5cGUgLTEN
CmRlYnVnMTogaWRlbnRpdHkgZmlsZSAvcm9vdC8uc3NoL2lkX2VkMjU1MTktY2VydCB0eXBlIC0x
DQpkZWJ1ZzE6IGlkZW50aXR5IGZpbGUgL3Jvb3QvLnNzaC9pZF94bXNzIHR5cGUgLTENCmRlYnVn
MTogaWRlbnRpdHkgZmlsZSAvcm9vdC8uc3NoL2lkX3htc3MtY2VydCB0eXBlIC0xDQpkZWJ1ZzE6
IExvY2FsIHZlcnNpb24gc3RyaW5nIFNTSC0yLjAtT3BlblNTSF84LjA=

--_002_SG2PR04MB30930AE9AE508E17FB788D66E1360SG2PR04MB3093apcp_--
