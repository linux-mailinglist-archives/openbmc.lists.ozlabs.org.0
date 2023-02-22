Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FD6A012D
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 03:28:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMcPv54Y0z3c2j
	for <lists+openbmc@lfdr.de>; Thu, 23 Feb 2023 13:28:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=cpJYue1H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.148.236; helo=mx0a-00268f01.pphosted.com; envelope-from=prvs=741722f0c2=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=cpJYue1H;
	dkim-atps=neutral
X-Greylist: delayed 20113 seconds by postgrey-1.36 at boromir; Thu, 23 Feb 2023 13:27:29 AEDT
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com [148.163.148.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMcPF28wwz3bqW
	for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2023 13:27:27 +1100 (AEDT)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31MKRc50010139;
	Wed, 22 Feb 2023 20:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=cNtXihHN1ZqURdP27t2wqt02iEsPc4yCHo+xSoTlJt4=;
 b=cpJYue1HYUH+ldJj43XAPGTt3CuwDC0Kh3uqaZUXBQvFEKiQVB7UgjtJOT0w1to8eDPK
 8c0+RQCvvasxFCp4zcH7+Or8oWXZgv8RCnrVatkIgtOKENts/SIJg8vea0566hyBpQJY
 +rJCLhhTvcSNKThJ1b/yx4keXOg01h9ERaSVsv6YvS8xo3v638TRjiBPlRXXXKSh/CVV
 gD62XKCH0HPk9ArjAeMOlSg3FHzkDsMW8/AbEyRzPD4J6Fid51Y/7r4+O3XKwQfMVily
 plgcVsnWoKenRVEL92+8o+jHWXCNWgJzFcOMRqwGHacggugF2KGtc3fREKChQJdaZuWr 3w== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3nwsprg5v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 20:51:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtWLXCQyZa93ncZDp27U/2DAOuoDWjHbpSO3vEIbd3qHACi8Al13D4gjTrU7dmF6pQabfdzL8IpsQwKY+KmUUnZEblieDo0tz1r12d0HVdEqsEeOFwaq6FJljI8NeBFyPnU2jie47mR9mZwdqfSubHiQQNK5EoC2r8jMLYz0ZFAIkAubaiHjXBlRNxQn/nhY0Sa48Gi3TaDHP7p2ChEgr49yr5umczxtYN6sOYUNI2Mq9JNGtHG7pWa8Rl6LigU3n5uH9RCWwGCEj/wTAGiNGySjGZLn9GVAhgG+zN/aRDOjCFxhAKy208aWCo6y+6xM3UmAYoeQrNePWVcnUnaDoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNtXihHN1ZqURdP27t2wqt02iEsPc4yCHo+xSoTlJt4=;
 b=kMCMqKBhFVya12QmPv2CWrHk+hFIZkFKr/zKunNLoCQQNMzJ/Nz2i/BIalAW3maeusKB7cjBnoTi/SQCmzBaGTdhyriVovzwb+E2ItHGa08Tk/M2n4wkY4KQmGq4wP2lfec51aMN75bZnEzI5CGNjNcf9F35f6G6Vb0dfyYmWglq9AFmqbwiotXWn+bWgaGsksJiBWMYQ3XkzP4OWs+NRq++vqTYLQcEBdU27TcVKkka4oWMZyCaUDbumOe+KNN5Hvmwko6zW+ngWePxtKQ4ESV+dwUW+3hyuDFRqsJb5eyEQ8LHMrIVQyn/0XCd+veuzQvUB9k/ef5owKbUvif3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by SJ0PR04MB7374.namprd04.prod.outlook.com (2603:10b6:a03:290::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 20:51:51 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8410:4100:4dcf:7310]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::8410:4100:4dcf:7310%4]) with mapi id 15.20.6111.021; Wed, 22 Feb 2023
 20:51:51 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Erhan Y. <erhan14@yahoo.com>
Subject: Re: Virtual Media service
Thread-Topic: Virtual Media service
Thread-Index: AQHZRv98lPoIGeaPVkWv7A+2PnHFLg==
Date: Wed, 22 Feb 2023 20:51:50 +0000
Message-ID: <20230222205125.GX18848@packtop>
References: <1506829480.2905286.1677091362958.ref@mail.yahoo.com>
 <1506829480.2905286.1677091362958@mail.yahoo.com>
In-Reply-To: <1506829480.2905286.1677091362958@mail.yahoo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|SJ0PR04MB7374:EE_
x-ms-office365-filtering-correlation-id: 09dfbae5-3343-4e35-438f-08db15169f5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  gwE4fZaJvQxDrEtXWOI49eRjugtJTwWDwYXPVmf+Yg6vGaPkGq574X8s7wnM0LsU/2J+umZKTjhkMQsZQ8nrJ6Zobdk6MWByIQ9GtAU8m/N/OHjiW1Ea0tZu1oHJXlFZ7E7MX3KgXtDXqOjCTVKNVLLw7qz6CL0g52eAeUrROM2zFZa1HYwBQycThlUfN79+rKR2Pl5Aqgl0yiCbOFKnss42Wy2bgilvHFNM6f/1Tkj6L8R2Tg8QNdpTqJlfmA7zkHNqAZPMufpmsijT4Fu4QIGoavf7/T8TFv/Uek2oCPkK/cYRVeTumaL1+kcf1/41hKug5XLoA3BbCLKkaHPeASk0/J02OtDb+5I0/z6qk6YmxNVzN9SoIz4W3SE9zg56FkOxqlyH9MlwUpsWdIel3DlltEOB8n8arWBhh9uoJvEZgQ06EROfSKms5PNkQ/XwN/t4WgtVOur0XEG0PSizVt6J23Hivl6R2VGsf0ZGTfBOFRc95x1KKXnp3xrLLEpjWaJ024RVVz+vSysQbPO0KA3j2ubfOovPVKdJ1udAdzs94QJo22hPycN1SUxR1h/Y3LKW1I2BE8JSWNe5M0bROa7K1eVdNG58/Y2Gb0wz1yQrjjqYbZMnriifkswoBFeLBj4YPaHz3KGx4gyEbujqKlJzEqMoF63CL443gvtpEQQt2KAsQkJJgHplHIpqsSwx
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(451199018)(186003)(26005)(71200400001)(5660300002)(6486002)(966005)(9686003)(6512007)(6506007)(1076003)(478600001)(54906003)(64756008)(316002)(83380400001)(66446008)(6916009)(7116003)(4326008)(8676002)(38070700005)(41300700001)(8936002)(3480700007)(66556008)(91956017)(76116006)(66476007)(33656002)(66946007)(122000001)(38100700002)(86362001)(33716001)(4744005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?NSCsoOBO1ibqBD0VMcQIbMFRCX/dB53PtwePL/ItHFmyj2S4vzbo6unN/5?=
 =?iso-8859-1?Q?JaBo6lLK/aLGHjxG4ZHu/jHBW++IUNLVU44fX57yuIdoBz5vgc0hkeErA4?=
 =?iso-8859-1?Q?IOCx5cfXopZ1nDiM4a3YzJe8iC7V1XRSS/2HX99qRdbpHqZxtmywCvGEmW?=
 =?iso-8859-1?Q?XDyfmnFKboehCy8m/W6tWaxyJ8Dd65wCGUBQO2kE4qwfJCj6aFNvdz7Unq?=
 =?iso-8859-1?Q?lRI2k6E7jeX1B0QHLOCMZexKXzu8zPHdO3IRlYvdU8ajypFv39IbM/6K6P?=
 =?iso-8859-1?Q?ON8Messlb+YVNZDGJhyxS/eU3+wL/3Mq4OFCQvn7wWxI38O631zGNzBxLq?=
 =?iso-8859-1?Q?ncxmv+XKGXY+F5a2k2VwY3+A7lu1epROKwqNdZISrmltql6iE4uoE9DmQs?=
 =?iso-8859-1?Q?M+sAOaPafCqwlJt8BPI+gUya0v+PQ6NuXjkYEdcdJwmPfIR87t1MTOz6Yo?=
 =?iso-8859-1?Q?nOEc4EA/pQJQWmncYZvVeje9EBp37Om6CLUsRmjj6Q+rK7QrzolqQCZBr9?=
 =?iso-8859-1?Q?QLwrO0Tvr62RyPVurU12wNq8/r25LCnWClB9k4a2EWYq9rNmMRrPYHeVHR?=
 =?iso-8859-1?Q?GUX4mNgBf19xMQWWiZvrvGhGkIwgqohTbchnKOaPncFKKEHxlazivSysnK?=
 =?iso-8859-1?Q?fERAB9RFnIk2fVPWviS7U/ypXajBQ06Y1CkSqxiEsOXrByL6f/NyqFaYHN?=
 =?iso-8859-1?Q?f44IF28fXxxHY12z+SXxSnoDpkqVKLdCPHCW2mYzCRgOVLs6NyT5/JmIjd?=
 =?iso-8859-1?Q?DLKSJYY71I9U5DgkUXw1+1at1KxXx2Ssy5N93ceSjW6ArSpNLlyNsQ5aP2?=
 =?iso-8859-1?Q?3egIpYn+Wy1ODaLn/exvs1ienhnBsUxGSW5h9NpBc003Xph0gG95EXIL1F?=
 =?iso-8859-1?Q?f4jnntoyRYPr14LEB/OFQm+RN1kKCsqiG38y/RWPGvEuE81q7db3djD3xM?=
 =?iso-8859-1?Q?rJ/5bR1jjvmdz9WmLjDLEuL5u19DCPIFnipXovYakEuGdOcQD+KXfkEDp0?=
 =?iso-8859-1?Q?G69Li6cGHapnDQDUAMx2P7tkFeR9RR4QdGT22PhWw4LYw8E9+JEN1Of7Oo?=
 =?iso-8859-1?Q?AyxsRDaUiYw/Z5zcDj4wZgIhvhyr0rFTnocl7kc4ZcjRXZIgGJHSdwkN4Y?=
 =?iso-8859-1?Q?sy2XRlcpudj3wcuAH7SwCY7vrFcKHGmMuD7VIEbmNzNnVOQakvUAWi2ROm?=
 =?iso-8859-1?Q?fbAqVbcKeYHQo7Ni80bY32ZYaSIt00uCpXkXro0SnD5kJDUuKycmx7yuHe?=
 =?iso-8859-1?Q?7PzzSluzEvx0Qohl/DVvW3qWUwTil3lgRP1OTXXthKmGNU+2JE1xWYoZPs?=
 =?iso-8859-1?Q?jJ7lbMf5l8fMmqpG58GTh5ER+39asOU13wPLJaIAjzoexZYm5nOCxI/zYq?=
 =?iso-8859-1?Q?2gUPRitjdZJv5V7IuTEaevGc/c+ezfgNHx40DYFYx4LmXRirBPXUil4U6H?=
 =?iso-8859-1?Q?W5By7UyNpbNPWKxP39SHX3LF5qr8K/1l87FTMTQpew0h/8srgiX4R3GfZl?=
 =?iso-8859-1?Q?OmNDyusYl3oYjD1ZboVm4y/Q4qWboKw9i95iTbpSdbUdHtRnOfUmIDxThE?=
 =?iso-8859-1?Q?PujNzw/Z8NNbDeCiTqq1YNnGGqKN/dkGCMl6wCbRJ9QvrF0sb8MYnhZDnb?=
 =?iso-8859-1?Q?L7TqMP6ocTbiPZRqli7PL5LezbRk6CeGr5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <DD69565B0008284BAEE5729CFAF33DA5@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	ylhVpiMB4xuzPwJTUGAy+FbWUx74/qWC8GfZQtQ+LtX3ntSOS4E4UmbNTyVtcAC0jQCQVAr9yoqU9zKuKN/EYdWp7scNkiVKuhJFWU7usRZB1bR7LOQCMBLpDKlQaJgwAyn4X+Ca28YMJ60pdIQfxY1q89K+1ziF8w1zG6Lg02thRtLHk+IHziC2AO1Hn4zIMQ9I3ZzhR0yD3uScTGGWczpjkNqHvWyaR2g6m02l8e6STtxAaWX0hFpi7fELK8sjZJ9YbZsgho8b+wGje38d1Tqw5t3QqpHxls7zrj7NtEEII9f54Um+R5/e4ioNC0t1dK+6FL+JOYQobNtcI4M/yZJBduTzN54SkzDA6TMG1MqskkVRDgJ/mUfEIs56Mr+bOAZ9QonJsc7NWwzK+jHuXS+Metwf4nHuN/q3gs4iVhSjyIXF3/0DGy/eG5PE2s/tBaLynkWsq1hMx1pqwqVEl92OPxMdsFlUJ/EgbSwOXNak4Ho1Ibfioq2jz8cv8jEtsXIeDy8pFUdQUzifVPsjrRxoo5Ozyp9CufANGAkwmw08NmVEoH/Z3nkJ/arka44j4Pw99M6Jc+xNEZelRJbQU1A4tIiB76EXLRANYdBShuN+3b0BtXAhTlYIsEFus5s5pnk4NN+9nalKq7QIwg9dkN1lQ1qscePq7D1bEovjIIyY4W0FMuUYIfSxZUQOzOU5M9xwI5ZS2TXDUYGRY1dOjdYhZtolqtIGcvxsl9hurSBJvGCdquOXhoMGhcB5WkLroLS2txvcF7PPz1c5EXqc1c8D8+63J7ZEcqJT2vx9t3K4Ujs/PeKtkKbGh50ZwSt+oNtbl0RWRX3/e0bFO3xBx7HkqJPWdNLc+4gjdfn5YGwbVSu/u446fuKYGvap0su0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dfbae5-3343-4e35-438f-08db15169f5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 20:51:50.9872
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b2BriuSNSnJxaHxU56JEji8aAGIpi0O/spI4cFVJpJnPHclGr17AY5CyRJvy8364fQeeMI2YiU4TyCDjqmjHXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7374
X-Proofpoint-GUID: nf_W4WeFovRPyhmg9uwl5CvShgEgUQop
X-Proofpoint-ORIG-GUID: nf_W4WeFovRPyhmg9uwl5CvShgEgUQop
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_08,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=884 bulkscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302220180
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Yiwei Tang <tangyiwei.2022@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 22, 2023 at 10:42:42AM PST, Erhan Y. wrote:
>It seems that virtual media feature is broken in the current langdale bran=
ch. It was working fine when we were working on kirkstone branch?=A0Any one=
 who has tried recently?We see that the state hook script is failing.=A0We =
are using ast2500 with webui-vue.=A0Thanks=A0
>

Yes, it's a known issue; there's a pending patch that should fix it:
https://gerrit.openbmc.org/c/openbmc/jsnbd/+/58920

Yiwei, do you think you'll be able to update that review with a new
commit message to address Jeremy's request anytime soon?


Zev
