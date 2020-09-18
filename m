Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD3626F996
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 11:49:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bt8FX6bh6zDqnn
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 19:49:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.128.113; helo=kor01-ps2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=O2OE9V3f; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=O2OE9V3f; 
 dkim-atps=neutral
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1280113.outbound.protection.outlook.com [40.107.128.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bt8CC1zmQzDqpR
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 19:47:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0H+k5+nvs1L8bY97OhZH9W+swaL3Lwp8mZwYWO4l94=;
 b=O2OE9V3fAipzoPYGoiJRUqYHylMv1OBj8wmlrluEwWHmJEPIwNlUGu5/BsHXBq7472y53jkBC44F66mVkaw8QTF5hCQABNYAQIGRkn2kyABmzHTERr8kRrazqnLi5Mp7SGe+mBfpTgAU6sLJj8kG0U9jUjUG9+7kfhDCmj108BM=
Received: from SG2PR04CA0179.apcprd04.prod.outlook.com (2603:1096:4:14::17) by
 PS2PR04MB3654.apcprd04.prod.outlook.com (2603:1096:300:6d::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.13; Fri, 18 Sep 2020 09:47:43 +0000
Received: from SG2APC01FT060.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:14:cafe::ad) by SG2PR04CA0179.outlook.office365.com
 (2603:1096:4:14::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend
 Transport; Fri, 18 Sep 2020 09:47:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; stwcx.xyz; dkim=pass (signature was verified)
 header.d=HCL.COM;stwcx.xyz; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.56) by
 SG2APC01FT060.mail.protection.outlook.com (10.152.251.153) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Fri, 18 Sep 2020 09:47:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3s3xngG2NyzDv2osFxsKBSWxPznAXMCj+tRwn9FFjWOEvSfmovm4x0n/F/rg8iPPuUwOt9HRH71Z8SVZRBEpMcOimSjUE22DNJGQM5mNc/un/4kff1FMmClsnCFtMy6ReHVx2xoMmmylEO6kc4gDz05dc6SlQ6ZVkOOmQfffzqgvhkDwIiiLDWknnp4pA877yeMfD/9v0Qh5ZAfQ8wFM2DYvjn7AY2o4F1HzH10CD9hlESQPL5zlYgvV5CJUenaGG7iJ1u4oHFPubvgABmyhTZcQx6Kbos4Pn2BYvkibESVYvC3k65LP3+0qoHH/uxJTPVSq/RWlPzCESTkITHMdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0H+k5+nvs1L8bY97OhZH9W+swaL3Lwp8mZwYWO4l94=;
 b=K01fEIdDHWwkHAzy4jRL9t6xp3npzhnzsKYduPhBsl+gRNeoWtNxq4HFaHZDQDJwuydL19mzM0YmvcGScyR+9G8giFmrkSAsBi6t4DuZZOi/S6VXZMMRWTlaa6posYR8A7AdGSactfexB2b0UnFLYmaKP8e3v0Ledm40oZyEy7eI4Fgcgfl7YgAVzh2HcsCxZZnHpsRAHgUKgpeIwkhvbTSbnucBqD31LgA7teVOjETIAfVybV2jK3NQzhZBkjVYUSg2HHxplnyo2ZtOUT1hOdqfM7pl/7qIlkj9sTnRm/jnZXzM/lmVRR1WDttm7hgx/AbgTA883eI/AUk8a90Ilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0H+k5+nvs1L8bY97OhZH9W+swaL3Lwp8mZwYWO4l94=;
 b=O2OE9V3fAipzoPYGoiJRUqYHylMv1OBj8wmlrluEwWHmJEPIwNlUGu5/BsHXBq7472y53jkBC44F66mVkaw8QTF5hCQABNYAQIGRkn2kyABmzHTERr8kRrazqnLi5Mp7SGe+mBfpTgAU6sLJj8kG0U9jUjUG9+7kfhDCmj108BM=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3771.apcprd04.prod.outlook.com (2603:1096:4:9d::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.17; Fri, 18 Sep 2020 09:47:32 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3391.017; Fri, 18 Sep 2020
 09:47:32 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Patrick Williams <patrick@stwcx.xyz>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Connection issue in OpenBMC image
Thread-Topic: Connection issue in OpenBMC image
Thread-Index: AdaIK6vt31RmicRFTiOQBEztxwnvYACTHsXgAAMSy4AANSDeAAAFmmiAACmSOpAAPPsWAAAkyl4A
Date: Fri, 18 Sep 2020 09:47:32 +0000
Message-ID: <SG2PR04MB30932DB1D5C88B0447DBC7F7E13F0@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30932185827E6DCADD02F422E1240@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <SG2PR04MB3093E7C8F543D9AD318B4653E1230@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <68131600080119@mail.yandex-team.ru>
 <SG2PR04MB309303A2C979A689DE8B67CFE1200@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <18221600180837@mail.yandex-team.ru>
 <SG2PR04MB3093A564F0482CE5FF12BA42E1210@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <20200917154534.GI6152@heinlein>
In-Reply-To: <20200917154534.GI6152@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiN2JlZDBkNDYtMWE1My00NjJjLThhNWItNmY3NDM5ZWQ1NTk0IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMFBmOFFXR3lUU1wveFwvTkZzWmJuQzhXeCtXVGhPTzNidUE5VW8zRWdlWlJJT0F0cFhpRkFGMWtHYmdYVm9Na0tBIn0=
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:38a:3b6c:6803:5d93:396b:e1d3]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1b51b104-7b0c-4e02-2b28-08d85bb7e2e8
x-ms-traffictypediagnostic: SG2PR04MB3771:|PS2PR04MB3654:
X-Microsoft-Antispam-PRVS: <PS2PR04MB3654D143A6363E9A2C9DDC48E13F0@PS2PR04MB3654.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: clSM9xsXI5BuTArGdTAEEkX/3pp9laOTKCCjm9FrZzb75vF3+aR6zLaxjzRFxLPRD2exSpk3rNJfuCnQOCyUQZLu5XmNr6SvNE9HA2cKJrh+4Nl/pI1AuN8lB69630kVryrErM9APYDPKIFP/R2SEvnJc5hdXoRUzsd2mgTCXmK6q1pwgEimVl4zmmoqrJZr1k2QRqzt/UGQEMOvSogLMTU+64sngoBaYTBM4LMdZKugfZ9pPF2fi4grT95O3MqdJI0fZRvfrp1eEUv8MCMluZq/dU6z8hAeYh+eOKelq2MQuZYTYnBSTxgvpRDRnd9X3saB+zla9JjgeLvTsLzVF/QzFgyMhZxf5v2jdusyw12tYFOkeGCdBkq2v8rsF8AdQ5UTWCPBzL4LzdChdHDNug==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(33656002)(110136005)(55016002)(30864003)(5660300002)(66476007)(52536014)(76116006)(66946007)(66556008)(64756008)(9686003)(66446008)(71200400001)(86362001)(6506007)(186003)(53546011)(83380400001)(8676002)(4326008)(8936002)(966005)(7696005)(316002)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: EBh/mDhrOKtLIOqDF+KdUHYrOQF18TRCKFKvfOn3j27A7kAahJ076WqaoJQGXy3NgToybhJ9BemcROr/KXvHwQBrIT2oD3iYXut4s4Ef6/Khy6CKFPSG91JzdVN0HwnE67WIsExT5BvKbUZ5zSnugrgEEiUzSUivuQ9NDu0AlwRAKfCYPUa3kgchJ0jueucMDJ5mpj6o1a61X7odW6e6YcDYFDVTMITCdJyZbl8/Uq/OZClF6MSwHYFF2Dn2LHPEX3sRU1KcKqMUnPK0JWaUxXAso6MKNZNsbGWW9q2pNEqmaLfheG790xXKRNUXFW9mK3byQIURmZRuvILbIZU3bW/jNBmEuVr62M/lnJFXKFPyQdPOq/v9MKy+VCJYg0vphLGEfFQjvoVFVXFrYxd0sJTNkvzFLKV+Sj/8iR1s+06rDjruwq1AIjd57eaIJC63h1/LTouNI/KoylucNkPlLfZRYLHL3edaj/ZnIwnFgkbDSfSMWINYrCavyGx//AR0feteWUnEm3mk9Ajynvwd38euO6b9ULp7wf6YW4Jek6gBAC3P+F+EWUz+jRAGDoGgb1g2npR9c/2n4cIxYo+wwSdsXv4dcMm/i9T5MxnMOADQjep//cLmFhEaeyeSzR8yZ8Gi9DwNWh21AD6ud3mhBtQ4R9V4xdPwqs6yLoMMtEcy+xkp0g1nIbja9LdW+yox+XgxUpYGPyLvnrWfBFXQ+Q==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3771
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 456a856e-fb55-4088-af31-08d85bb7dd90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tmq/doZ8UAVUE3p7QDLTVNlgTi6v1qjq+paTCci9H1olNd2UPjJ0mgLpSTQUeW8w/PSLdkrfLWzsNoREb+q8lczytbplGv5vCAtgPPsKT2leae56YOzOgoPeosXPaYCuQGrgAITUAzxkOZBPD32M4H3ykPIpXqdQy9qt3OM8E9aOLnhatkPpEyLGhu31nTw/08SvONEzby9fASw++5u/BnqJozloewIvg09arLvMD+Tsc7TF307SKpJJUiKr0PbSoCGdTC6scN1S99a3gXjq8djpi93sdrIzIX5yCZ4cyPwuKL047F+FOogNeasy8AWbuvdllZCZ1gEU+7SvziWS2fVFDpyBmj7ykvO50bY6Swc0LDgM3D1qZRDnZadcRKm8UICm6yjh9cjkuqCExQicY1Mkoddd36FGZhHXQbjneP8ztmMjYubsBWXjpW5OdXpWRWP4v79Et37ACbAkak4ZWUvVyyggcyFj4AAVbuu6iCZEXMc62gw88GhxViJtPwLtZk1AnhzCcpmZji8tK8dmsw1RLBPDWaYz2v6y95f/XO1TQSbZgeYMUph4o85yFG6u
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(46966005)(9686003)(478600001)(33656002)(966005)(70586007)(70206006)(316002)(8936002)(36906005)(52536014)(47076004)(7696005)(8676002)(2906002)(53546011)(81166007)(356005)(6506007)(5660300002)(4326008)(110136005)(82310400003)(55016002)(30864003)(336012)(86362001)(186003)(34020700004)(83380400001)(82740400003)(26005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 09:47:41.2796 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b51b104-7b0c-4e02-2b28-08d85bb7e2e8
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3654
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
Cc: Konstantin Klubnichkin <kitsok@yandex-team.ru>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

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
 get properties: Connection timed out)
3. I can able to ping the ip address but scp is not working.

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
