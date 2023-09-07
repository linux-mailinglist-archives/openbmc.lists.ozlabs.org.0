Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A1D797D05
	for <lists+openbmc@lfdr.de>; Thu,  7 Sep 2023 21:52:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256 header.s=smtpout1 header.b=iXcbX0Mr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhVK15rq0z3c2x
	for <lists+openbmc@lfdr.de>; Fri,  8 Sep 2023 05:52:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dell.com header.i=@dell.com header.a=rsa-sha256 header.s=smtpout1 header.b=iXcbX0Mr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dell.com (client-ip=148.163.137.20; helo=mx0b-00154904.pphosted.com; envelope-from=prvs=1614288be3=dipinder_chhabra@dell.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 3849 seconds by postgrey-1.37 at boromir; Fri, 08 Sep 2023 05:52:20 AEST
Received: from mx0b-00154904.pphosted.com (mx0b-00154904.pphosted.com [148.163.137.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhVJN3wYgz30hY
	for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2023 05:52:19 +1000 (AEST)
Received: from pps.filterd (m0170398.ppops.net [127.0.0.1])
	by mx0b-00154904.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387GUVN6014352
	for <openbmc@lists.ozlabs.org>; Thu, 7 Sep 2023 14:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : subject :
 date : message-id : content-type : mime-version; s=smtpout1;
 bh=fwveJdTAQprIW2NJoSWn8D2qIXe/EyEuRv0Q/RS1Rbs=;
 b=iXcbX0MrrG9Wh/NL7Z8FSdyhUKDaVpzpAwQZzx2UKfodIdDYxFZT7zlvIYZwxXjgqaea
 5BI47HfcuvYWyMhoS3aCl2WtprGvHaHGMo0fO377ChgIIcZWhuXdCIn/RX/I5hXAGvZ+
 sntiUljDZVhLMAzMtMN1svYmIpvciCDeN7VSckqShw55rXpwbWhpGAIizs1KUHpwLB67
 wffWZ2E5L1PYj39q1A1t7OZGGtCErmwIpXF8RwomJNUpcOUEGLsk9pf0GIj7J9XuuTHB
 En2f9LRXgVCLSp58P0Voao/vafsJ1Rt1mgSDwpp3W+bvqiIGAfZ5Kr9FPYYMpPgI7rNW hQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
	by mx0b-00154904.pphosted.com (PPS) with ESMTPS id 3sv099jk4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2023 14:48:06 -0400
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
	by mx0a-00154901.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387GHetK016274
	for <openbmc@lists.ozlabs.org>; Thu, 7 Sep 2023 14:48:05 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-00154901.pphosted.com (PPS) with ESMTPS id 3sye7j7by4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Thu, 07 Sep 2023 14:48:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXKbYGyra0pIG8Q6F2ZwfEFJujhGIqhGX1fYf44Oz7PNVpfbP2LURuDTmWuA11Sq1zvakD1Or4EEStTIoos+cBwgWC5HOXaFhb7kuRvswNf0BQl4E717xFzTeH3a7gwmcU/EhjVobWJR66pjENDTB0r8RwJ2Wl58jj0uthGp3q+g9WyzGCAgw0hOWz9W3hyxyLIYaPWrPT93ROueclq8AIin+kDdg+jn802xi8cOhMusOovB+tbKX2zXJlRS0C8oEZJdR1KyQOMZmKSUvAhUSPRdAXY3OAVJocN/4xayRFds/O6UVyzgC8c5rVjWtDUZBZfcs+KnFKSz8rwsoBwB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwveJdTAQprIW2NJoSWn8D2qIXe/EyEuRv0Q/RS1Rbs=;
 b=cVj9Af2xaeAC5zc1EqzGvpgShmmv5k/V/oM+90kW1aS9GpGKrywfFRJBqTKEdennmc8XJShwm+JCaTnJbv5mzbCyyvij9N2LCpwFyTfz9hOO0EgOBo2WWsVI/yDR2a86Ym7K6n2YdUKCDDZeRlMXELOXik+PJnL4omus1+tirSDVtmry3W4lAp7XCjngeXpLNyyI4CgqZ3WTGWROAqH3NlML4Wmv/02chGfIddpilyxp65OvBta48kinRVxI3bGbiKJ3VtOYwbwWMThOleCr9fdD57ZWuiKYPlRrV/iAXj5JfeFxjTbyTGiu0nl4W67ymIEXFsbpUpOq9ZHmuX9FXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from DM6PR19MB4107.namprd19.prod.outlook.com (2603:10b6:5:246::19)
 by MW4PR19MB5656.namprd19.prod.outlook.com (2603:10b6:303:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 18:47:59 +0000
Received: from DM6PR19MB4107.namprd19.prod.outlook.com
 ([fe80::dd02:ff37:16f4:19f8]) by DM6PR19MB4107.namprd19.prod.outlook.com
 ([fe80::dd02:ff37:16f4:19f8%7]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 18:47:59 +0000
From: "Chhabra, DipinderSingh" <Dipinder.Chhabra@dell.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: phosphor-network terminated due to SIGBUS
Thread-Topic: phosphor-network terminated due to SIGBUS
Thread-Index: Adnht6WAT7ylFYbIREqfzKnKE6/eLw==
Date: Thu, 7 Sep 2023 18:47:58 +0000
Message-ID:  <DM6PR19MB4107DD5C47856396755CD0FC91EEA@DM6PR19MB4107.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=true;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2023-09-07T18:47:58Z;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No Protection (Label
 Only) - Internal Use;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ActionId=b403e9ff-9316-4489-9506-57c5e6b74d68;
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR19MB4107:EE_|MW4PR19MB5656:EE_
x-ms-office365-filtering-correlation-id: 3bcfc65c-635b-4450-e9a4-08dbafd2f4e7
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fzSwYOo9faJRMJY/Pcy7GzMY5O9SpU/ZetMgx6PYJwSZ8UlrE09orDDl3oUcI0sLKdOJWY5glVr7DKx/mZ2woT0ntPsB+R8CRR89hm7XpIFjRdw6xHnKGNjg59tx3Z7hCQBnXFIJQoAh/h4cNzjSkgtiFuzZj249hPaLtzIBbPaQcJwAxD9FgZz1o5eEiUKrsD2PKOd8dEAORmhrFF6unw74BI4qk65ePuf/mRE18IZaooaW7f2YtZM/1jcod4jUy3pFdWqDkTkE9VgCGcFs5OM4oZg7VqczrJrWIUh1+PM2TWTIFnPX5OzyFns8Nhcs/Ea05Gp95oIvAHiW/D4+Z34RZB/Z7NJLPnauhymd1LWXHca6BtmSbBMSMFo35iXCmqVoqdDvYh39mBz4vHSYsiiYBsMgkAQcNVdjbKRgL+h0oLjY2QNyYgRHoBHRw9sBJMOoNNs93qyor0vWNxTSIXBMdIdqO8XQdWwxcQlxZBoYit+vBz020K+JPZuGnVGCpUXvXmS7HDB3OEpSZ2efSgqAxXJNYgEZzrxqmkQKi2//i1i0GRfZP36j4Ys8Up97ZkYqArP0dZsDqHoP1qElygFaLexn2oOq6OVuwU4u3pha9hIONSOzR/+r/y4KVhp4
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB4107.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199024)(1800799009)(186009)(52536014)(64756008)(66946007)(316002)(6916009)(66556008)(76116006)(66476007)(786003)(66446008)(8676002)(8936002)(82960400001)(55016003)(122000001)(6506007)(7696005)(9686003)(41300700001)(478600001)(26005)(83380400001)(71200400001)(5660300002)(2906002)(86362001)(33656002)(38100700002)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?kayjDflx3PX3c7ABdAZMBLoVLqgpqHh57PpB9dpOWM7LDoiIqBkWPYFPS2U+?=
 =?us-ascii?Q?gzM4yz7cQKjJnG9rCVrj+YSytX7ItFH8fnzTVSGBk8R2eHtEuuyfia8VDjKp?=
 =?us-ascii?Q?WWyukTs0AawzYOW0iOSgFJUqI2ZzkvqJUgvC8awYNYk+TEDW4CYmX0syyhJj?=
 =?us-ascii?Q?5A13O7bhjBKhC1BIFUo3E3iplhxYw8answ8bZ+tRgEvUB+mcul8EypBwrN0I?=
 =?us-ascii?Q?89YRat+dgychp6h0tEXHmn81S3JxkxmBUaJ/d+01tVXAIkTHMYvGEpTvvXmd?=
 =?us-ascii?Q?eau19iiroL4F/11opxnMejNGud+ETGL5jec+VW6Ny6GidfxZpVSrd6Ug/Spw?=
 =?us-ascii?Q?deVaMZa1OiSEdsHPpy7fp8XR5V0B/WXdNbTSSa6ho/uJ2+F8jVPx6Jfk3IWn?=
 =?us-ascii?Q?jwnr2BEbV2xWOKeZkMyBTU7yuaabXIMjNkKfvvjkCBhhXA6+u1yKD7/Zs1Xf?=
 =?us-ascii?Q?Jt6pKDbswOgEo4/oDkM6ytWT1AN6/PYNlo3tesPMvjYfcu7yzNwNNOEmJ1Pf?=
 =?us-ascii?Q?f3+kBVo7Ju9pXzEX+myPt0cbzL11YOtAhJC9gPN81sg+KuB8A3ZQU+x2jtMT?=
 =?us-ascii?Q?anChZ+R7RJNOw+bD2pXH4tp8nG9ECyKNP3CfsY4eG1dOQi06zecfHbYbgCQz?=
 =?us-ascii?Q?0O/qbOZ1H5Y2o/Bkg9b4O9s/lkSgu/ojHuo4c0kl8gbNyE5Dy/wn/ge23DRj?=
 =?us-ascii?Q?ciCb+MajF582mZ3LAfcEXUHGOHbXG3jjcT0Lz7fdUwu1Uf8C+zIZ7sII+G1U?=
 =?us-ascii?Q?eFPYpXAc0jqg8MPyemcgZWZ+6rfyhjUrftLt1WyqtsloMQar6NS7ZOQb/kDh?=
 =?us-ascii?Q?ISyo1wx56AeTDDRNJt4GqPp1sQvfh/Pm9ByO/7TWLig4uRMNruy2/gSHdYVB?=
 =?us-ascii?Q?x4ocBD+Us7WOA0/vHP6uWkN4sxtqxVtioQzl+I/larr82B0C1zTVrXXkkNSS?=
 =?us-ascii?Q?BGx13HS8C0cqqKjlvrO7BJfGn1MIWaFAxMZ22O4QO584kpuesSJ5BTDYayLT?=
 =?us-ascii?Q?OBhA8aPJHUXQ3nJ0EWthuKS+G+uRM9uNcJuzDr4qi2xVToR+7HshGt34UUdW?=
 =?us-ascii?Q?8CzEk5z671MlNxTIYn0GTwJChv06xI62QVyrj3aTIkxshsLuI68fe3ULT0Aq?=
 =?us-ascii?Q?moEA5dbhVeiBI2w3kgF4NSULSKR3lGV0leoMZn2SByRI043ABxCVoV5OsmmJ?=
 =?us-ascii?Q?o6KoH7CLq5NU9HlZtz9H737LWeM1Yd3auUeO6iZ3+hN3bRDDx/uhh6UVqFli?=
 =?us-ascii?Q?Fe0sf02zmUyblKnu3NWnRQrgaN4Yaqceuh/xwsowsenlXKNs6DsWphWQmy6C?=
 =?us-ascii?Q?+wyYfVyViP7Qa7uqQh/km7a8I6VxJWqW5EOsNnKNjsXmY+gVZMojDJ5ZYc2/?=
 =?us-ascii?Q?jSp0I3NSt31dZRS+0UrHfwVq5V/dGdT0ogKZnMhv9yZYV2ysn5lj1sWpfKhk?=
 =?us-ascii?Q?dtyr5KEykEl6/l2n+LlNZySM/i42LM2skuZzOzzzfec9pTA6hdh0Zs70uDC0?=
 =?us-ascii?Q?iP/prGz0Pm+O1P8VaAaTNI4KOvFiJq8k47tWmfa7dg6u6r/tjM0UMJ/VKpJ/?=
 =?us-ascii?Q?REopEy23mj/ndms9Dl+QgDiH7xI3MUqj4xdKEvTzPc6OXvrsZxJOAzauxnyb?=
 =?us-ascii?Q?0w=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR19MB4107DD5C47856396755CD0FC91EEADM6PR19MB4107namp_"
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB4107.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bcfc65c-635b-4450-e9a4-08dbafd2f4e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2023 18:47:58.9644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 268YdHa6caDI+suJgWrIaaomXOIAKlTjzpkRqz0rtS95b4JKIMWmb28U0jW7XmjzHCr9Aacwq60bcJ413ipvuF9IIJBA/T+6LqE3hKTjsWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB5656
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_10,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=835 mlxscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070164
X-Proofpoint-GUID: RYWk0SuaZL19xYFGg4XQh4Vb9d0gBv5M
X-Proofpoint-ORIG-GUID: RYWk0SuaZL19xYFGg4XQh4Vb9d0gBv5M
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=902 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070164
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

--_000_DM6PR19MB4107DD5C47856396755CD0FC91EEADM6PR19MB4107namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi There

Recently we updated our OpenBMC distro to tag 2.14.0 (phosphor-network SRCR=
EV f78a415e154bac274e1d07ce8128c69e9d1cd710).

Since then we are seeing that the phosphor-network service crashes after co=
nfiguration change due to SIGBUS.


Sep 07 09:51:45 bmc phosphor-network-manager[627]: Wrote networkd file: /et=
c/systemd/network/00-bmc-end1.network

Sep 07 09:51:45 bmc phosphor-network-manager[627]: Wrote networkd file: /et=
c/systemd/network/00-bmc-end0.network

Sep 07 09:51:49 bmc systemd[1]: xyz.openbmc_project.Network.service: Main p=
rocess exited, code=3Ddumped, status=3D7/BUS

Sep 07 09:51:49 bmc systemd[1]: xyz.openbmc_project.Network.service: Failed=
 with result 'core-dump'.

Sep 07 09:51:49 bmc systemd[1]: xyz.openbmc_project.Network.service: Consum=
ed 1.365s CPU time.

Sep 07 09:51:50 bmc systemd[1]: xyz.openbmc_project.Network.service: Schedu=
led restart job, restart counter is at 1.

Sep 07 09:51:50 bmc systemd[1]: Stopped Phosphor Network Manager.

Sep 07 09:51:50 bmc systemd[1]: xyz.openbmc_project.Network.service: Consum=
ed 1.365s CPU time.

Sep 07 09:51:50 bmc systemd[1]: Starting Phosphor Network Manager...

Based on my debugging, I can confirm that the timer gets scheduled correctl=
y after the config write and the registered call back does get invoked. The=
 crash happens due to the below dbus call in network_manager.cpp.

        try
        {
            bus.get()
                .new_method_call("org.freedesktop.network1",
                                 "/org/freedesktop/network1",
                                 "org.freedesktop.network1.Manager", "Reloa=
d")
                .call();
            lg2::info("Reloaded systemd-networkd");
        }

I have looked into any fixes to this in the later commits but do not find a=
ny.

I also tried to change it to call_noreply but that does not help and get th=
e same BUS error.


        try

        {

            lg2::info("Try systemd-networkd reload...");

            auto method =3D bus.get().new_method_call(NETWORKD_BUSNAME, NET=
WORKD_PATH,

                                 NETWORKD_INTERFACE, "Reload");

            bus.get().call_noreply(method);

            lg2::info("Reloaded systemd-networkd");

        }

When I manually invoke this from the shell that seems to go fine.


root@bmc:~# busctl call org.freedesktop.network1 /org/freedesktop/network1 =
org.freedesktop.network1.Manager Reload

root@bmc:~# echo $?

0

Anyone else seeing this issue with phosphor-network or any idea why this co=
uld be happening?

Thanks
Dip


Internal Use - Confidential

--_000_DM6PR19MB4107DD5C47856396755CD0FC91EEADM6PR19MB4107namp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi There<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Recently we updated our OpenBMC distro to tag 2.14.0=
 (phosphor-network SRCREV f78a415e154bac274e1d07ce8128c69e9d1cd710).<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Since then we are seeing that the phosphor-network s=
ervice crashes after configuration change due to SIGBUS.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre><span style=3D"color:black">Sep 07 09:51:45 bmc phosphor-network-manag=
er[627]: Wrote networkd file: /etc/systemd/network/00-bmc-end1.network<o:p>=
</o:p></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:45 bmc phosphor-network-manag=
er[627]: Wrote networkd file: /etc/systemd/network/00-bmc-end0.network<o:p>=
</o:p></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:49 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Main process exited, code=3Ddumped, status=3D7/B=
US<o:p></o:p></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:49 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Failed with result 'core-dump'.<o:p></o:p></span=
></pre>
<pre><span style=3D"color:black">Sep 07 09:51:49 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Consumed 1.365s CPU time.<o:p></o:p></span></pre=
>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Scheduled restart job, restart counter is at 1.<=
o:p></o:p></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: Stopped Ph=
osphor Network Manager.<o:p></o:p></span></pre>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: xyz.openbm=
c_project.Network.service: Consumed 1.365s CPU time.<o:p></o:p></span></pre=
>
<pre><span style=3D"color:black">Sep 07 09:51:50 bmc systemd[1]: Starting P=
hosphor Network Manager...<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Based on my debugging, I can confirm that the timer =
gets scheduled correctly after the config write and the registered call bac=
k does get invoked. The crash happens due to the below dbus call in network=
_manager.cpp.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; bus.get()<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .new_method_call(&quot;org.freedesktop.net=
work1&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/org/free=
desktop/network1&quot;,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;org.freed=
esktop.network1.Manager&quot;, &quot;Reload&quot;)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span style=3D"background:yellow;mso-highlight:yellow">.call();</span><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; lg2::info(&quot;Reloaded systemd-networkd&quot;);<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have looked into any fixes to this in the later co=
mmits but do not find any.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I also tried to change it to call_noreply but that d=
oes not help and get the same BUS error.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 try<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 {<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; lg2::info(&quot;Try systemd-networkd reload...&quo=
t;);<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; auto method =3D bus.get().new_method_call(NETWORKD=
_BUSNAME, NETWORKD_PATH,<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 NETWORKD_INTERFACE, &quot;Reload&quot;);<o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; bus.get().call_noreply(method);<o:p></o:p></span><=
/pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; lg2::info(&quot;Reloaded systemd-networkd&quot;);<=
o:p></o:p></span></pre>
<pre><span style=3D"color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 }<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">When I manually invoke this from the shell that seem=
s to go fine.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre><span style=3D"color:black">root@bmc:~# busctl call org.freedesktop.ne=
twork1 /org/freedesktop/network1 org.freedesktop.network1.Manager Reload&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></pre>
<pre><span style=3D"color:black">root@bmc:~# echo $?<o:p></o:p></span></pre=
>
<pre><span style=3D"color:black">0<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Anyone else seeing this issue with phosphor-network =
or any idea why this could be happening?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal">Dip<o:p></o:p></p>
<br>
<p class=3D"msipfooter90245289" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:7.0pt;font-family:Calibri;color:#737373">Internal Use - Con=
fidential</span></p>
</div>
</body>
</html>

--_000_DM6PR19MB4107DD5C47856396755CD0FC91EEADM6PR19MB4107namp_--
