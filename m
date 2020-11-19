Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2748F2B8BE7
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 08:08:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc9kb3hfbzDqkP
	for <lists+openbmc@lfdr.de>; Thu, 19 Nov 2020 18:08:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-sg2-obe.outbound.protection.outlook.com
 (client-ip=40.107.131.45; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=VMXpaRTe; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310045.outbound.protection.outlook.com [40.107.131.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc9jY1c3qzDqXt
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 18:07:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F+EXsGEO4BA/FZmr37tRdmyzZaTUq1FdS3mcmT8HhPcO3PApUJL7Qs7cBKjXfqN23ZfXnL7Kg4sIJHf2pI8nroxCtGi0Ihg0BQA9egR0TctU7cfxj4DjUYn9slEB8E4+eeF0foLadvXgh38KJC/zb5P6KCi6oj0CSpsKrqFHgHjKz+zfuSW6RB0XNLBqn9sVFVaJuhHkrDdxBecfqL6tKn+zo38J4lku1/KaE37Kftj/tfSusT/G4mCtMTiFUDZuRt3YLkhq7jVZwydGcNj0MZ26/9yI/J7t2jeD5Td7Rwa4IOZqpMGfS28DZHL9HxFJzEqmeFUA3HI+8/7yZ2oVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8usMEcdzSWbXwDopZ8GRxwvGRuGtGQexy5aMEUaoQE=;
 b=AB4E+nw+zV0VXwHctEIeZaq6ilonebOta4fCr+ecli0NLWw/qd96iF0y9YbtcwT0x/V28rSCX6zyksmXNlzFFTYuOz96d2w7XPtEXtua7p840sy8aQmJyO8lITUKssTK2ZMP4HV5b57ZUvzdGAOBPWxQP7RLNAKAllHM4TBuoK62wnrTGtOuIwz7yRG5+sS9aD9iosC06oVWy18/wgoxuzqkDp6b0f3tw2WNvXCYwgf6eixm4SAGGzVuIrVZOedEtkeJALW52G3O8A3AJ7Fsoq+TZ38MxdAnR5BWhmyKu+Ji85CDRnmcy84gG+WTdEZ1CQgo24NB5t6pHbFYYzuD7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8usMEcdzSWbXwDopZ8GRxwvGRuGtGQexy5aMEUaoQE=;
 b=VMXpaRTe7HH0uqQEsxV+0g+KkE3ASzm6wVQ5F+Xkhdb6UzSRI8jkjWTxilzPhpYV/bCSoJM68HcPc+Vd3O4OqmDb7DorBYlKZX5GEAsdG7slAP39JkeLf8RUsFTEYc1s3G5S66p1mK4pKJhR59cbEiRX4MCmz2ksRSR3YLhRU98=
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com (2603:1096:203:bf::11)
 by HK0PR03MB3841.apcprd03.prod.outlook.com (2603:1096:203:3a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.12; Thu, 19 Nov
 2020 07:07:20 +0000
Received: from HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::8403:27f:5d08:49dc]) by HK0PR03MB5090.apcprd03.prod.outlook.com
 ([fe80::8403:27f:5d08:49dc%3]) with mapi id 15.20.3611.009; Thu, 19 Nov 2020
 07:07:20 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: RE: [Test Automation] [Update Sevice] Failed: Test Firmware Tftp
 Upload Image.Install Same Image Two Times
Thread-Topic: [Test Automation] [Update Sevice] Failed: Test Firmware Tftp
 Upload Image.Install Same Image Two Times
Thread-Index: Ada+EccgOITEwJM7T+WVPH6/zFAEOwAE9xcAAAATjQA=
Date: Thu, 19 Nov 2020 07:07:20 +0000
Message-ID: <HK0PR03MB509032688E3421C233CE7A2ECFE00@HK0PR03MB5090.apcprd03.prod.outlook.com>
References: <HK0PR03MB50904A3601BA9AC1A0F9BC0FCFE00@HK0PR03MB5090.apcprd03.prod.outlook.com>
 <b9c6f22a5a0f0054f864ebcc2fb281ec@linux.vnet.ibm.com>
In-Reply-To: <b9c6f22a5a0f0054f864ebcc2fb281ec@linux.vnet.ibm.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=nuvoton.com;
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f69bcbc-ebaf-448b-094f-08d88c59c1b3
x-ms-traffictypediagnostic: HK0PR03MB3841:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB3841DA249624ED85328351D4CFE00@HK0PR03MB3841.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AixW+/A+rlnBNH0clFtzIPcGcCo6Wz05LJI7gvexkPkcQu4UN7K9wikqhXd4iusFkkdaXOKTC4i+j5uoUNbsOzHMbiszCerzl/MhybaynLOpR2BWSd1hbATSgufWDzEzYaqHrusQuaHALMzB/S/eDl1ZltN+btfmvENz8MQK8XasWFXHQ0wBNAlUjC4RBqUb8iiTJJwr+1/SxUHIreDolLTSlVVhDOQDn1oiMTddz/LlNeEE0mbCaZSD8zE7FOpunAOz7oF2EaBo/dlLF31RF6pK6nY7hLioZycEgmOwXDm8gG0yXkunCT0tXVhA5ICKKoWK/iZOrunYWyH9KWudD3D8BxGq9q5pFFiyof2zwsILg9hx10rDxfFeBKjwPB5fNITS8/KuwqRfVINRY97yIw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB5090.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(86362001)(76116006)(66476007)(6916009)(66556008)(64756008)(26005)(966005)(53546011)(15650500001)(66446008)(54906003)(9686003)(8936002)(186003)(478600001)(33656002)(8676002)(52536014)(83380400001)(316002)(4001150100001)(66946007)(2906002)(107886003)(4326008)(71200400001)(7696005)(5660300002)(6506007)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: IDf0Cs2tFDHisVW+hiMb0rWHCZyt/6QzYcGYLIcL7Y4gJtV4KxsqthRHWF18+Ryz9GfmWryXxqEwZWXx3n0FylNIberAQ3SyUpi12W0X8YoIZtgYmqWEuRz4vg0nXvnpHSZdto9cmbBFF4gQ4iCF8dPsyX2d6OsaRZVQvHE57Qqrk5SreMBCOJ75esTvPc5CbIg9MdbghjfL4+foXqlrW4z8UeZAxYGxudYvpRdcdLT8TuWxNDGWuPsDqwCvwG3LxX56rshoaNUZqPbwkYnOf304nDbz4r0YxdQ+l5tyiFw35WnQMY7Eh414dN+7Gn96kaOsuuDbHFtsIjxveySGznF3WT/jO4uGg/H973/Mav7MjQFYuMbyt+5ocxwhIaJzIYWOnOEeVusTz+raaC8bzvzLF0ga5701hhcDs4N84pEWDZUXfiMPSlrH/8624krC+EyDQ/NTqkjqPfkyUtmBa8llW2CxDXXpkzSAUrAxQ2fixfWb0aDwj9mXiXVnFzpgOFFo0J5bay7cZK6+w3jxtspUq/Xh/kM1/p790FanveSvbaJLhJewxr4cv6US27s0DS2MJj/ExyuyZIdEs7l2+ib7h+9DS79kcn9krwx4SXyk7EUmpkDevhB2lMsHrov4wgSO0BicmheNgLbKaYHuMy+XdxtXnylSgakGJ4vZLUMsemAGsP7KStDy2geHUucGAz/LqOc1x8UoOBKwgOgcPk8DYd5jvCiDGr9p/90OvGaF2NUKykJgzIPksXF5v3GZgUII4vbYO6LXRH9baMDw8HoMKOPrUCC6RSZ1RIDKiEuHDzgcQWLdi8ZxR3AxvnVves4p2qLAABTnwSagAm0L1QU7/0t+mSxv6G3KCXsf8dXbnX9pCuM/YGtDGNgX+nH6BrY2+YQ3Oboxmd0GZQ+7zA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB5090.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f69bcbc-ebaf-448b-094f-08d88c59c1b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2020 07:07:20.1230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: riVhJ2O19JMU+OO9KBeYRKK+WpEmKTKBInCIuW+V4HZg26Xo6Vy9XEtClWbjbm085lQMF37Z+eq6SQd5yhyw1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3841
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "anoo@us.ibm.com" <anoo@us.ibm.com>, CS20 CHLi30 <CHLI30@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Adriana,

Thanks your prompt response. You can check more detail from the robot scrip=
t:
https://github.com/openbmc/openbmc-test-automation/blob/master/redfish/upda=
te_service/test_firmware_tftp_upload_image.robot

Test failed at Get Latest Image ID return false, due to /tmp/images/${image=
_id} didn't exist.
Below are failed log and test script for you refer it. If there is any ques=
tion, just let me know. Thank you.

[Failed log]
Keyword 'Get Latest Image ID' failed after retrying...
The last error was: **ERROR** Invalid variable value: image_id: <blank> <st=
r>

[Test script]
Same Firmware Install Two Times
    [Documentation]  Download same image twice to BMC via ImageURI. Second =
attempt would fail.
    [Arguments]  ${apply_time}  ${tftp_server}=3D${TFTP_SERVER}  ${image_fi=
le_name}=3D${IMAGE_FILE_NAME}

    # Description of argument(s):
    # apply_time       ApplyTime allowed values (e.g. "OnReset", "Immediate=
").
    # tftp_server      Server IP.
    # image_file_name  Image file name.

    ImageURI Download Install  ${apply_time}

    # Download image from TFTP server via ImageURI to BMC.
    Redfish.Post  /redfish/v1/UpdateService/Actions/UpdateService.SimpleUpd=
ate
    ...  body=3D{"ImageURI": "tftp://${tftp_server}/${image_file_name}"}

    ${image_version}=3D  Get Image Version From TFTP Server  ${tftp_server}=
  ${image_file_name}
    ${software_inventory_record}=3D  Get Software Inventory State By Versio=
n
    ...  ${image_version}
    Rprint Vars  software_inventory_record

    ${image_id}=3D  Wait Until Keyword Succeeds  180 sec  10 sec  Get Lates=
t Image ID
    Rprint Vars  image_id

    Check Image Update Progress State  match_state=3D'Enabled'  image_id=3D=
${image_id}
    # Check if the existing firmware is functional.
    Pass Execution If  ${software_inventory_record['functional']}
    ...  The existing ${image_version} firmware is already functional.

Get Latest Image ID
    [Documentation]  Return the ID of the most recently extracted image.
    # Note: This keyword will fail if there is no such file.

    # Example: # ls /tmp/images/
    #            1b714fb7
    ${image_id}=3D  Get Latest File  /tmp/images/
    Valid Value  image_id

    # Though an image sub-directory was found, it really isn't valid unless
    # the MANIFEST file is present.
    BMC Execute Command  ls -l /tmp/images/${image_id}/MANIFEST

    [Return]  ${image_id}

Best regards,
Tim
-----Original Message-----
From: Adriana Kobylak [mailto:anoo@linux.ibm.com]
Sent: Thursday, November 19, 2020 11:40 AM
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Cc: anoo@us.ibm.com; openbmc@lists.ozlabs.org
Subject: Re: [Test Automation] [Update Sevice] Failed: Test Firmware Tftp U=
pload Image.Install Same Image Two Times

On 2020-11-18 19:51, CS20 CHLi30 wrote:
>
> Recently, we met 1 test item fail "Test Firmware Tftp Upload
> Image.Install Same Image Two Times" in Update Service of OpenBMC Test
> Automation.

> According your commit, I understand this is a good fix to clear no use
> image files in /tmp folder.
>
> But, it seems against test item of update service in openbmc test
> automation.
>
> The test script will check if the existing firmware is functional
> according image_id in /tmp folder, if existing then it's not allow to
> update same image two times.
>
> However, after your commit then test script will fail due to image_id
> dir be deleted. Did you have any suggestion for this symptom?

Hi Tim,

Could you provide a bit more details about this test case, you hint that it=
 may exist in the openbmc-test-automation repo?

The openbmc-test-automation handles this scenario by extracting the MANIFES=
T file out of the code update tarball before the upload and reading the VER=
SION string, then comparing that with the VERSION in the /etc/os-release fi=
le in the BMC to determine if the version is already running in the BMC.

I wouldn't recommend trying to generate the id from within the test case be=
cause the algorithm may change. So hopefully checking the version string is=
 an alternative that'd work.
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.
