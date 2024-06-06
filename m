Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B98FF58E
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 21:58:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=Zg0/zyGO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwFWW0Pmmz3fs7
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2024 05:58:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=smartm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=smartm.com header.i=@smartm.com header.a=rsa-sha256 header.s=selector1 header.b=Zg0/zyGO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=smartm.com (client-ip=2a01:111:f403:2418::720; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=rajesh.ananth@smartm.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20720.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwFVy0xSWz3dXW
	for <openbmc@lists.ozlabs.org>; Fri,  7 Jun 2024 05:57:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xc4aT1VZJ5Vy4Lc+eeYmyP5Dz5YCo0fAoJ7/wI4KHxrkl6zwPkTmkWkBUprw9bir08M+RyQW4F44M61dwdYqvreCk7moNVKAdKY0ACBoqFZkbMYUvfRhEPeWtGstl6NYFxBYFihA209BgVhIlyKde+KbS6MxYkCEazVaoKjaf/u0nEteS6+0uEYBKbBMqcV+wbryWK71ffRbjaVOGOSIJewhYEccLq9FNCzFFjyyiXkipx17JKVPAP0Y7Zw5GY/o+oTRlLEA7Gw48yB5u2Mys2t0ro5KAQLL4bcQwCFejN8i8dzywaWF9Yqp6Z/GJcimnTj8bGg6B4opIvyCF8mZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XacmbtaKNe0QT548gP6KATjwuMxfZDkZ25MYumYI+6k=;
 b=fuUeBXlhO+25Qr5GWtsrA+Qc8rqOf8ncYA1zoGY3qFQi2V7Q8f9H4YlzI5Z17dS3Lb+Y6WMjbAcudZaT4UrWh/cqwcYJIrHvOJcaPcUFTabmqICBfS5KagqEIY0l1fT7NjQrjrSYOdRiJo068BwrfXgmehBIXhjkOqtjIxSbIh+kRMbDmOaJI/7sjrxtsEB0WBThq3Xy4cuMuO6TOr/hK5WzZLJUOJKcfBMtdmxeG1I7RNUUfn58ZtedK5j6vRtrjRRKs5XINUhV9m5Vg1Vg1/bcfXgzkZWVABm+H0c7oDKu7+miR6pQ4F8O80SV94nfV+36K0YS6WAkvVCCVhpORQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smartm.com; dmarc=pass action=none header.from=smartm.com;
 dkim=pass header.d=smartm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smartm.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XacmbtaKNe0QT548gP6KATjwuMxfZDkZ25MYumYI+6k=;
 b=Zg0/zyGO4x84r5XPwEqm0ycu9cKDACY+Ohm1TpldFK0jflqYP2xZP30e5hHnP6udmQ1/NebyJS/dUmyKicQcYYaaS8IvnGRFFqnPYeHAhgUHVrKUVZrMFhuh7O09uwv+MtyeEoMevC49muc1LeSv1mZWx/LEwcoLkMmZckzU0LV15ic9Br1QeQQABRLq/XZDHiawxHPZn7womyqe8jJQ5tD+XFVrQS7o8ssLQRMdQyDeFcVDILRn/jJ3N3oa/9Fl20WBXQopUPJUone/B3QaVoK5wkUoUia0ZdK/DXxDjaXZFqE9F9xeIf66yPIRXw69dAuiEXGVX7VnSjsQkBe/2w==
Received: from BN8PR04MB5906.namprd04.prod.outlook.com (2603:10b6:408:a7::27)
 by CH4PR04MB9105.namprd04.prod.outlook.com (2603:10b6:610:224::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 19:57:31 +0000
Received: from BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3]) by BN8PR04MB5906.namprd04.prod.outlook.com
 ([fe80::15ff:a949:91cb:8bf3%5]) with mapi id 15.20.7633.032; Thu, 6 Jun 2024
 19:57:31 +0000
From: "Ananth, Rajesh" <rajesh.ananth@smartm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: bitbake compilation errors
Thread-Topic: bitbake compilation errors
Thread-Index: Adq4SyTOApJzinevTfm5EwGOq4vn2g==
Date: Thu, 6 Jun 2024 19:57:31 +0000
Message-ID:  <BN8PR04MB5906280BF43CA24D2EA9E1D094FA2@BN8PR04MB5906.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smartm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR04MB5906:EE_|CH4PR04MB9105:EE_
x-ms-office365-filtering-correlation-id: 04a884fd-03f6-4aa1-7b4a-08dc8662e6b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:  =?us-ascii?Q?Ej/XG2JM25j/uhqi6Dbj1mQi8LxI7jcsi4k6UtD5gm94Szq6jarakE9pa3q8?=
 =?us-ascii?Q?ZXi4UnnnssFyrxqTObQEM0iWkym9gUDv2nHqFVhDa6nw1Qk7RsIbz6Uiyk2F?=
 =?us-ascii?Q?LcdyXEyUk8YWUDYc0s2eFyLjU/zWh32UfGNFgMG34ODcF0nN9wXGogTJC3MA?=
 =?us-ascii?Q?oMO3qYb5D27uvik1Fw8eSg4lf5MAgv0s6qzoRbygUm0y6aQw+h4F7EKJkFCf?=
 =?us-ascii?Q?fEyeg05cqAHfQYXJ9SjekoHMNcOYmJUjpnX5dpscN+2+A3LmfF3Qf9ONxOEu?=
 =?us-ascii?Q?vROgmF+7qVQmfNbU8E/J1p+88u4Zee7quATieQjBrOcpe5y53nym6p2IKae4?=
 =?us-ascii?Q?aUnJAWPNcVV/E0rMNFw2mFsB0nt5kpuN33rJmSqTNF9i7ckwOilFexQDwuAk?=
 =?us-ascii?Q?3K0wRD03Mnq0cNPR+CDNHUZoJNUVQMXHSlmXMixX590l9sUqcGrqw2QWk2rm?=
 =?us-ascii?Q?7HR2p5rMlDU7b8zJviujrdjM2VbYFsvijwzUD2rudusnZPd/VPuSXvKKDckL?=
 =?us-ascii?Q?T5P59y23ZE26V7kQZyvN9pEwpicfCCFB7L1pXbdXCpYyx3H6X2ImZj/bchzn?=
 =?us-ascii?Q?wCXb4Gy9S7xuSr7edbpHrs5YCnr/XJ6vs6ELenoUOgNN+AYhFALeKxO/aBwl?=
 =?us-ascii?Q?oP8pPTTvWBKRgOmTaK0WelvqyrgdgAtqCix/qLnF5uok0du2IChw3lvSfvsL?=
 =?us-ascii?Q?x7C/dGbnflfZKaRCJu7vC4b2T33eYHIjBSU7kwXfpZuXHrpe2eJtfOotEu/6?=
 =?us-ascii?Q?EovjxFo2xIV7usvxU5zSLrtFhy5LxfYNZdkxbYrLNqwkE0fU5zGIWDTwVtkc?=
 =?us-ascii?Q?F50hnuaOQhhlAh6FK3rsA6k7yZMAoXhGKK8Pfv29b7VyxjnqPA0xV7+Hds3i?=
 =?us-ascii?Q?uhCvxzPSWk5NbYOMbnRtyWH8AsYTtP7a3QmBLM5jGiWbPcM0zf5VaAaf529z?=
 =?us-ascii?Q?J4NbUrnE7UgWvolZ18QEV1vpEIZNRyC3/gGPqo9TL/cMnovsocoVY3tywoa+?=
 =?us-ascii?Q?FfKdQ/jQGF3MNEBJdh9+u7X1xaqirmdDXqr19921sV+5eO3vzXgLay03HmlL?=
 =?us-ascii?Q?5ZNn1ewYyuTl7dA1OH6xeEQN4Jn5sH27a7lKH3PcDMzN2TphHpeo1cXQSwK0?=
 =?us-ascii?Q?CjHfqS8cai5VvcUn2sapBvWCHNT/gdGVXPV2G5dsw3SEAFseo/8Vbxkd1R/1?=
 =?us-ascii?Q?lD8zkNhZK23lJxMxPty0x6KRLgpLr/uX/bIFlUMBavz3DhlaP6GF9Usaovfv?=
 =?us-ascii?Q?USGggpnHh2LW0X6MZ0cCRmf0+b81uaqXLjPqk7b712sNTT9kWw0ekM4g71iy?=
 =?us-ascii?Q?rWB+5hW+hbrSMJ2+QfIraAJIT7BDGSk0ovUATnzV6HtMcOz6UV0scv3y4nPH?=
 =?us-ascii?Q?+qgV6jo=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR04MB5906.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?6VMY0nF3C/6AfCuOEnSEr0eO0n2nSntbum6uSKBYC7Xkz+UdVJYqwGQml3Fa?=
 =?us-ascii?Q?zyGM/jkzFoV+3DCtxxXRDBdDflXwA4hzNyTZlnNt7H1p/PxyAMjn4rVWhCoP?=
 =?us-ascii?Q?aotz1yWCT2zUgLVMPpSWXp00QVeX2VbRe8RtjnXRwtc45a8lY5NcFeN2O8m0?=
 =?us-ascii?Q?u0RAmjgllH56HXb5BhHuW5xwzaqrxxFXkQaVmLSN8vdrF/aMTV3fS4RKL7LM?=
 =?us-ascii?Q?VxOBU6GECXI3PhavLaWfg8I3JtUAz9Nbi+IkoGDttdYXxhGQGRR+bY7rQDC+?=
 =?us-ascii?Q?RIdihOBHmhSyjveVhV/xzRt4h71J2lz25BFPwm9merKRTvpOGpfRXgDPsvpk?=
 =?us-ascii?Q?Tfq32EjaSXM2GI8Zzh4c7b7tyV40IrjhngptvdTjICWgxDPEXLKNvVS6qiA+?=
 =?us-ascii?Q?S2fExeQxlJaLqecun3+aCR2EKBfMTA+o3vFaLHOgS3RaiZ3DQDhbuR8RR0Uu?=
 =?us-ascii?Q?yOc0wlldKlWOkM47wI6iKNDXp5e3eBKQYiRnMtZchJnxF98x3vC/eJSkYOml?=
 =?us-ascii?Q?XGppWOrABThVpFtdPx1Er2VeC3OE0eip4cHapzvGGPXhffbiaqyVpIS4jj6a?=
 =?us-ascii?Q?1P/bazy3mi9YSL/toeWbRzAwiaLkEkbvVIRBv7PkFYhT6LvyF43QwlHuXJnw?=
 =?us-ascii?Q?R5bNNGiYy8S5nfreY6Djn9nGqpLqospOsVFwhDCt67mDqmUaK3j8VVD5xVfx?=
 =?us-ascii?Q?f0jbQoIYa7B3I9k0j+u8zA5rhrzCqGHxgHvKFdGtylqfIDkm25tC1S1CHlm0?=
 =?us-ascii?Q?7NIx2t2EsCfMIHO70E7gBr+WImtKIVwMVrWOHCKhThvwx/CyW2aqiHJGKAad?=
 =?us-ascii?Q?fgHrfoE2dqe8AM5anyJHeTiUT9b9uLJeS+1044taPKJAwB/xaRkf64fr80y7?=
 =?us-ascii?Q?alx5MzXsEZ3L+UMihsAz5X4s3XgfmTjfDvT5dGZHv24T4oFGxgdYNhWUCx13?=
 =?us-ascii?Q?qcpGkMVlUggKwt1nDrrgsryfu4UMbttf+khdk/LJhJzf8j9mrKHY7SyJ05tn?=
 =?us-ascii?Q?+XSqAWqxpkua9ODF8qz2BDpRTMMZAu/C37nKadwDlH3D5iuGmGSA11TbFvLy?=
 =?us-ascii?Q?MGZRSvXNw/m+u/0Q1JRBtcBBEmbmwKkDJL5lCr3SQXW4uVhpFwksXNXYInmF?=
 =?us-ascii?Q?jw1QNuEdwX2YDuVDM0cWJ32eNZ6/9/FqzmFkjeKnHEIJreCpVWpiWSxhaHwW?=
 =?us-ascii?Q?I56JGlsdv8PSX3RhKWdzijrg5Q+g6pcd4LjaAQZ63kylk2LOL/rvxtk95hid?=
 =?us-ascii?Q?iUSZ8ak5OARVGqIhAAihRs0kdTW9gkdmanI7OPSX49+vkl2Z58qID0EDGEaW?=
 =?us-ascii?Q?gjDWtUNeJ1bf8xZwTbPcWkssvu3ruuT56hejk/fceNXG7q9L2QiAm73uxsif?=
 =?us-ascii?Q?raYdsACfZzUfhUYrDCi3GcLrLvrG0stCiuBcnOjyx7y/VIEyFpKV49kr8Ypq?=
 =?us-ascii?Q?iKpsUNo+FraxtjfboK7BzNVieWjHw6+LhyWpCIe5D5SzWyiGlb/dYUyaS2ww?=
 =?us-ascii?Q?HMTY1Nzec8GNr3E5WNG7acWjuW+1KQLtFLaRn2AOvdYOpYEK+ve62owO9LZP?=
 =?us-ascii?Q?oSkoBoK5E9i1chLVgNKFVT4Y8LCk1H8UFLtcS8a0?=
Content-Type: multipart/alternative;
	boundary="_000_BN8PR04MB5906280BF43CA24D2EA9E1D094FA2BN8PR04MB5906namp_"
MIME-Version: 1.0
X-OriginatorOrg: smartm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR04MB5906.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a884fd-03f6-4aa1-7b4a-08dc8662e6b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 19:57:31.4662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0fd7909-cd13-4779-b0f9-5ced6b7a2c68
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: THyXyjlNhZsvFNrKna4ZUfY1eg6jR0B9tdKwiCk18fnhk1Ahoe+cTLx5RGBUVBl0mWoBtesmYDFocTaRbeSuLm4bOgXGduCdK8no9EPUNd0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR04MB9105
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

--_000_BN8PR04MB5906280BF43CA24D2EA9E1D094FA2BN8PR04MB5906namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Bitbake, while compiling the nodejs-native keeps on failing. It happens irr=
espective of what platform I am building for. Does it require any package f=
ixes for nodejs?

Build environment: Linux bld-ub20s-openbmc 5.4.0-182-generic #202-Ubuntu SM=
P Fri Apr 26 12:29:36 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux


|   g++  -o Release/obj.target/v8_turboshaft/deps/v8/src/compiler/turboshaf=
t/memory-optimization-reducer.o ../deps/v8/src/compiler/turboshaft/memory-o=
ptimization-reducer.cc '-D_GLIBCXX_USE_CXX11_ABI=3D1' '-DNODE_OPENSSL_CONF_=
NAME=3Dnodejs_conf' '-DICU_NO_USER_DATA_OVERRIDE' '-DV8_GYP_BUILD' '-DV8_TY=
PED_ARRAY_MAX_SIZE_IN_HEAP=3D64' '-D__STDC_FORMAT_MACROS' '-DV8_TARGET_ARCH=
_X64' '-DV8_HAVE_TARGET_OS' '-DV8_TARGET_OS_LINUX' '-DV8_EMBEDDER_STRING=3D=
"-node.17"' '-DENABLE_DISASSEMBLER' '-DV8_PROMISE_INTERNAL_FIELD_COUNT=3D1'=
 '-DV8_ENABLE_PRIVATE_MAPPING_FORK_OPTIMIZATION' '-DV8_SHORT_BUILTIN_CALLS'=
 '-DOBJECT_PRINT' '-DV8_INTL_SUPPORT' '-DV8_ATOMIC_OBJECT_FIELD_WRITES' '-D=
V8_ENABLE_LAZY_SOURCE_POSITIONS' '-DV8_USE_SIPHASH' '-DV8_SHARED_RO_HEAP' '=
-DV8_WIN64_UNWINDING_INFO' '-DV8_ENABLE_REGEXP_INTERPRETER_THREADED_DISPATC=
H' '-DV8_USE_ZLIB' '-DV8_ENABLE_TURBOFAN' '-DV8_ENABLE_WEBASSEMBLY' '-DV8_E=
NABLE_JAVASCRIPT_PROMISE_HOOKS' '-DV8_ALLOCATION_FOLDING' '-DV8_ALLOCATION_=
SITE_TRACKING' '-DV8_ADVANCED_BIGINT_ALGORITHMS' -I/home/rajesh/openbmc/bui=
ld/s7106/tmp/work/x86_64-linux/nodejs-native/20.11.1/recipe-sysroot-native/=
usr/include -I../deps/v8 -I../deps/v8/include -I.//Release/obj/gen/generate=
-bytecode-output-root -I.//Release/obj/gen  -pthread -Wno-unused-parameter =
-Wno-return-type -fno-strict-aliasing -m64 -m64 -O3 -fno-omit-frame-pointer=
 -fdata-sections -ffunction-sections -O3 -fno-rtti -fno-exceptions -std=3Dg=
nu++17 -MMD -MF .//Release/.deps/Release/obj.target/v8_turboshaft/deps/v8/s=
rc/compiler/turboshaft/memory-optimization-reducer.o.d.raw -isystem/home/ra=
jesh/openbmc/build/s7106/tmp/work/x86_64-linux/nodejs-native/20.11.1/recipe=
-sysroot-native/usr/include -isystem/home/rajesh/openbmc/build/s7106/tmp/wo=
rk/x86_64-linux/nodejs-native/20.11.1/recipe-sysroot-native/usr/include -O2=
 -pipe -c
| g++: fatal error: Killed signal terminated program cc1plus
| compilation terminated.
| make[1]: *** [tools/v8_gypfiles/v8_turboshaft.target.mk:177: Release/obj.=
target/v8_turboshaft/deps/v8/src/compiler/turboshaft/late-optimization-phas=
e.o] Error 1
| make[1]: *** Waiting for unfinished jobs....
| rm d85b0cd18d0307252071c96a6ed9b0c9664aa71f.intermediate af4e842a57ff19a6=
520eb7907ccb4a3969f292c1.intermediate f6356c0b28cf2ef78d26a21531153d32a6176=
eb4.intermediate
| make: *** [Makefile:134: node] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
ERROR: Task (virtual:native:/home/rajesh/openbmc/meta-openembedded/meta-oe/=
recipes-devtools/nodejs/nodejs_20.11.1.bb:do_compile) failed with exit code=
 '1'
NOTE: Tasks Summary: Attempted 3967 tasks of which 12 didn't need to be rer=
un and 1 failed.

Summary: 1 task failed:
  virtual:native:/home/rajesh/openbmc/meta-openembedded/meta-oe/recipes-dev=
tools/nodejs/nodejs_20.11.1.bb:do_compile
Summary: There were 2 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.


--_000_BN8PR04MB5906280BF43CA24D2EA9E1D094FA2BN8PR04MB5906namp_
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
@font-face
	{font-family:"Lucida Console";
	panose-1:2 11 6 9 4 5 4 2 2 4;}
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Bitbake, while compiling the nodejs-native keeps on =
failing. It happens irrespective of what platform I am building for. Does i=
t require any package fixes for nodejs?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Build environment: <span style=3D"font-size:9.0pt;fo=
nt-family:&quot;Lucida Console&quot;">
Linux bld-ub20s-openbmc 5.4.0-182-generic #202-Ubuntu SMP Fri Apr 26 12:29:=
36 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">|&nbsp;&nbsp; g++&nbsp; -o=
 Release/obj.target/v8_turboshaft/deps/v8/src/compiler/turboshaft/memory-op=
timization-reducer.o ../deps/v8/src/compiler/turboshaft/memory-optimization=
-reducer.cc
 '-D_GLIBCXX_USE_CXX11_ABI=3D1' '-DNODE_OPENSSL_CONF_NAME=3Dnodejs_conf' '-=
DICU_NO_USER_DATA_OVERRIDE' '-DV8_GYP_BUILD' '-DV8_TYPED_ARRAY_MAX_SIZE_IN_=
HEAP=3D64' '-D__STDC_FORMAT_MACROS' '-DV8_TARGET_ARCH_X64' '-DV8_HAVE_TARGE=
T_OS' '-DV8_TARGET_OS_LINUX' '-DV8_EMBEDDER_STRING=3D&quot;-node.17&quot;'
 '-DENABLE_DISASSEMBLER' '-DV8_PROMISE_INTERNAL_FIELD_COUNT=3D1' '-DV8_ENAB=
LE_PRIVATE_MAPPING_FORK_OPTIMIZATION' '-DV8_SHORT_BUILTIN_CALLS' '-DOBJECT_=
PRINT' '-DV8_INTL_SUPPORT' '-DV8_ATOMIC_OBJECT_FIELD_WRITES' '-DV8_ENABLE_L=
AZY_SOURCE_POSITIONS' '-DV8_USE_SIPHASH'
 '-DV8_SHARED_RO_HEAP' '-DV8_WIN64_UNWINDING_INFO' '-DV8_ENABLE_REGEXP_INTE=
RPRETER_THREADED_DISPATCH' '-DV8_USE_ZLIB' '-DV8_ENABLE_TURBOFAN' '-DV8_ENA=
BLE_WEBASSEMBLY' '-DV8_ENABLE_JAVASCRIPT_PROMISE_HOOKS' '-DV8_ALLOCATION_FO=
LDING' '-DV8_ALLOCATION_SITE_TRACKING'
 '-DV8_ADVANCED_BIGINT_ALGORITHMS' -I/home/rajesh/openbmc/build/s7106/tmp/w=
ork/x86_64-linux/nodejs-native/20.11.1/recipe-sysroot-native/usr/include -I=
../deps/v8 -I../deps/v8/include -I.//Release/obj/gen/generate-bytecode-outp=
ut-root -I.//Release/obj/gen&nbsp; -pthread
 -Wno-unused-parameter -Wno-return-type -fno-strict-aliasing -m64 -m64 -O3 =
-fno-omit-frame-pointer -fdata-sections -ffunction-sections -O3 -fno-rtti -=
fno-exceptions -std=3Dgnu++17 -MMD -MF .//Release/.deps/Release/obj.target/=
v8_turboshaft/deps/v8/src/compiler/turboshaft/memory-optimization-reducer.o=
.d.raw
 -isystem/home/rajesh/openbmc/build/s7106/tmp/work/<span style=3D"backgroun=
d:yellow;mso-highlight:yellow">x86_64-linux/nodejs-native/20.11.1</span>/re=
cipe-sysroot-native/usr/include -isystem/home/rajesh/openbmc/build/s7106/tm=
p/work/x86_64-linux/nodejs-native/20.11.1/recipe-sysroot-native/usr/include
 -O2 -pipe -c<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">| g++: fatal error: Killed=
 signal terminated program cc1plus<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">| compilation terminated.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">| make[1]: *** [tools/v8_g=
ypfiles/v8_turboshaft.target.mk:177: Release/obj.target/v8_turboshaft/deps/=
v8/src/compiler/turboshaft/late-optimization-phase.o]
 Error 1<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">| make[1]: *** Waiting for=
 unfinished jobs....<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">| rm d85b0cd18d0307252071c=
96a6ed9b0c9664aa71f.intermediate af4e842a57ff19a6520eb7907ccb4a3969f292c1.i=
ntermediate f6356c0b28cf2ef78d26a21531153d32a6176eb4.intermediate<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">| make: *** [Makefile:134:=
 node] Error 2<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">| ERROR: oe_runmake failed=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">| WARNING: exit code 1 fro=
m a shell command.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;;color:#FF7676">ERROR</span>=
<span style=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">:
<span style=3D"color:#D42C3A">Task (virtual:native:/home/rajesh/openbmc/met=
a-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_20.11.1.bb:do_compile=
) failed with exit code '1'<o:p></o:p></span></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><b><span style=3D"font=
-size:9.0pt;font-family:&quot;Lucida Console&quot;">NOTE</span></b><span st=
yle=3D"font-size:9.0pt;font-family:&quot;Lucida Console&quot;">: Tasks Summ=
ary: Attempted 3967 tasks of which 12 didn't need to be rerun
 and 1 failed.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;"><o:p>&nbsp;</o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Summary: 1 task failed:<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">&nbsp; virtual:native:/hom=
e/rajesh/openbmc/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_2=
0.11.1.bb:do_compile<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Summary: There were 2 WARN=
ING messages.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">Summary: There were 2 ERRO=
R messages, returning a non-zero exit code.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BN8PR04MB5906280BF43CA24D2EA9E1D094FA2BN8PR04MB5906namp_--
