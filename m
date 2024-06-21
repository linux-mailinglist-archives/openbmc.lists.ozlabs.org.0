Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44652911CC6
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 09:30:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=GAIwQ/BI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W58Cf00Ncz3cZt
	for <lists+openbmc@lfdr.de>; Fri, 21 Jun 2024 17:30:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=Ltts.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=GAIwQ/BI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ltts.com (client-ip=2a01:111:f403:2020::600; helo=ind01-max-obe.outbound.protection.outlook.com; envelope-from=bala.subramaniyan@ltts.com; receiver=lists.ozlabs.org)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2020::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W58C24yX3z3cRy
	for <openbmc@lists.ozlabs.org>; Fri, 21 Jun 2024 17:30:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPyXKZ/NX7DVErqByGBeHN17KJWE+YDVshKnsgerNnRLWrcEBf/fvsdW1J7UlLeZStGNJZDUA4yz3D/tSBXn5OLpmAj7DtyVg/QtSbWCzt/SC54we/hbNhb4KbvRjJ5nUuneyQiYowxaegO48z7PWsKZHVMmVMWJiZUswiRY/+FYffpIgP2atNqbyUKaSe0fFxR57C4GObNbuWt9RGopcycETI8CdtWWm3qDQXVVMjzXt9T7K7fwte1WKjLJb6JNMmCRfj3IBSzmFUL62K60+G8YNdlzYFyngywd7Bw+NOAVV5HEOUG+3zjJl3k9B5nUoHtlTGBk/dtSQ/wc9uZRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UogT+D3z+8sWYVuaDLEG6zR7NWc/y11Igobf6SsF/Z8=;
 b=IA2GJchcZjt1B1YubJS7I4Vnx8JUpwCIfx7HvTzPAyVhVhNtmsvoyZfICTvjUsivAIOLkgXwMOLsMX6jBHkkVi/4caMeIa4nZY7cqwb1yTRX/I3YrjQ4CjzRlgWlZLT3QnC99mW00JTSbBmduL/lCNFRXFuE4h6Ix5WIfKzGXRQegzA1e9OC07VnHliLSKOGbdecMfRdnlQupZvQ6bwcAtC28J8ARHMpFAVm3BDEGQOxl704cxySIXnhq0ahTeywMAj2HQi+1ylIzy/VNNZiGQ6IHdEiNC7gMcVI4brF6N2CUIK3F59G4JZi4QtIqehe4uin+Hij9dCDOkULs22DIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ltts.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UogT+D3z+8sWYVuaDLEG6zR7NWc/y11Igobf6SsF/Z8=;
 b=GAIwQ/BIAzfhiN9I7mvK1Kp4C7hzZ8pxqsuoFxu98Jh/StAvQPlGdQQJUw1/NL/sdWPJSU26R40uQInHEOqsaiVtTiM3tjafS+zxd6239XJsw1fYFxbBNUnXy0LaTqk//P7PColeVrqx0ZKse1H/wD1SBQquJNWZWg4Cwv2vqGeW5sxKTglV1yoV67E8IUzHrriurBc4zbAeJkcgWJf4SkxQn1W78jjRIsjSLlwKHuV1Aoq27XWjoHXSDzkTBC6h14a6XHlbD2CJKftY7p8iNHlNqopK+Ggx51viCYlpHNe90/rYEBy8186XxNGoKeRYR/khHfoBI60QSunMojZEPg==
Received: from PN2PR01MB4315.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:17::13)
 by MAZPR01MB6467.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:72::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Fri, 21 Jun
 2024 07:29:38 +0000
Received: from PN2PR01MB4315.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::163b:ca56:aa30:37b6]) by PN2PR01MB4315.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::163b:ca56:aa30:37b6%5]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 07:29:38 +0000
From: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>
Subject: Re: Help with IPMB (IPMI over I2C).
Thread-Topic: Help with IPMB (IPMI over I2C).
Thread-Index: AQHawvq3HaRNbNKpv0ezQLXMYofq67HQluEAgAAFYqaAAAjmqYAAJO8AgAEHbqo=
Date: Fri, 21 Jun 2024 07:29:38 +0000
Message-ID:  <PN2PR01MB43159CE56C08B73540969B1480C92@PN2PR01MB4315.INDPRD01.PROD.OUTLOOK.COM>
References:  <MA1PR01MB4308AF26A122B17FCC91768C80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
 <ZnQiNlMOYE0ATrKK@nbwork.lan>
 <MA1PR01MB4308550B7CF6199FE4E5433A80C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
 <MA1PR01MB43082375F4F0563E9E6AB23080C82@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
 <ZnRNLKeblSrD92n3@nbwork.lan>
In-Reply-To: <ZnRNLKeblSrD92n3@nbwork.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Ltts.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN2PR01MB4315:EE_|MAZPR01MB6467:EE_
x-ms-office365-filtering-correlation-id: 7dbf0ef6-e047-450f-ed71-08dc91c3e89c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info:  =?us-ascii?Q?846CQTOtGs57Nk5+02eo8FUgXJwGfEtJqlCc6rbGIbUpxOLPpq9OWLR+SaGq?=
 =?us-ascii?Q?2FPSZqvZjqG+JJvhZ7ogtuUH5OMGgZZTNjPCHbVgjwG+P1h065SYtSOggXV1?=
 =?us-ascii?Q?sdIiTWWrQ1WN0mE2SPBdEtn9q53lPiiy7JT37ccjS77riAMg/ej8uicJ145d?=
 =?us-ascii?Q?/CZlAfZvdsglvGxi7EidSpB0WxlL4RiZn0BJedxWmJOZJpu1/jgJJJN7Wv7k?=
 =?us-ascii?Q?jc+/Tv2T/pi5Pfx9Bp8L/XS+amY8DYoibrkIK3crUPEcQTSK8NIUG3vww04B?=
 =?us-ascii?Q?9SzYnQ2WL9ib44ogUuscEnY5w/1wXWuYDIRhdyZLidAp4I/xZR2DTAF2opi3?=
 =?us-ascii?Q?rHUau0TMkQHLDovzqcm6pL0oWtU1mBHKGhmRnYhEFNYc5+k22X1VuY5NXo1N?=
 =?us-ascii?Q?OEFcFdrKzrk1o1bX+O1/eVRIvjhBKfZWkVaqyLBiXWbeXLsJ1+BdVjuDQpIG?=
 =?us-ascii?Q?7nZrluL215PC7If+3fBz2FJMAiXhtN1fK/k68yZGm5iBzIGNqPIRhSWx+3e5?=
 =?us-ascii?Q?+xOOVHmk51jrBAT9jkUnIRJWJUDwE2mxuEK04PI6+laaEbVeurA1EgszJTwc?=
 =?us-ascii?Q?7lH/17WOnc4qGAEfk7eOFbT+LYQglqnlfc5nTyCxiZzp8CQAGFaT9dn3pzcR?=
 =?us-ascii?Q?32b6ccNhLNZYo9GduMgDPwaKDYipAPsCGJ8mEAduiy7A+G8ajbWdChPw3FlH?=
 =?us-ascii?Q?3JJystBwU3aDorA1iSw88LRTHmZir2MX5/r1GhD085lGnhvaE/7Kqt0yf3I3?=
 =?us-ascii?Q?xZRBbd1mtoDGuiqMgcYdwLh+j3vxEBewYS5ivNjHdw67d9dL0apMJU5T6oJt?=
 =?us-ascii?Q?ptvPdndFUNNNICXR1CZS4W24HDlYqMLBfkI6mse7c37p+9zEhJWQVEnXS7TJ?=
 =?us-ascii?Q?5qHR7Ogm3ohd0Cu+iuo0aO2uh6MSM8EwnjNhjCL+1tZse1URxHMg9QZdYnvh?=
 =?us-ascii?Q?asulWJmoP8xaeoY2mgeEzGQjZJiL0EjjZdmGMV+WpeOwJN8txygGaZHMcRRE?=
 =?us-ascii?Q?yoQLmrZJsp5yYUkTENti3zf7IkxSObW89EA9/4LnrkESOJxreVwCQ9hKTpMq?=
 =?us-ascii?Q?CdTXR2ox5sEFD/xlhjbjFk+dfWif7qVshmtsOY51+gXELn6jOeso+Ya7TO7x?=
 =?us-ascii?Q?YNePI0RQcLniq234sT+htZeCzl2pzfzUvLS3THIbvuP00uR7vU+WeYakc0u/?=
 =?us-ascii?Q?eGqMdAc4Lgx7lCbzIfKoDOjyEkjIxHAOga8ZAAbMLbI5YQghaqHtNeNgipQR?=
 =?us-ascii?Q?bcae6fMVl6WdpOH8AR3ww4EWRG225ZLFkFXwGbMjCbh7Pi5xcVagTPih1Fw7?=
 =?us-ascii?Q?yhD6iZIaVDd1dlVLADsKEQD/7ljw6xaZIn3yJ/CfQX0WPA=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4315.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?EI1Iyo5DF6WKJK0ij1e4dq2HU1xt1QwuPcbyNQfBd8H05XWvfes9LBE+XUuC?=
 =?us-ascii?Q?PAr2uZYEyOTpwB+cNWLIUOrbFq8a6+YGWIRfNvNr4Q1mINYNiM7t9l+5rr2a?=
 =?us-ascii?Q?6Zk+tNwpJU6RXfG8FIh2Hp+maectllAw7L79CPROagwMwvrrjhuGgGQBhBD5?=
 =?us-ascii?Q?n9d8RVMuzATif0RHAvxcSU7z9mIGFHly9VwDevWopiiqBkbTaDGGdrf3tLGv?=
 =?us-ascii?Q?/49eBgaHBIe4P2Wk4Ph4XtpYTDdXwwamRbtTWSbu8ni6Ok9zZE6SOiCjDcSw?=
 =?us-ascii?Q?Cy6Won8RG2zf1ntr5TKokJBb+daE/7iZsazR7CxTR8kNq3DKkk+7so0Xgqzg?=
 =?us-ascii?Q?kQZNXm/HfwUw8bQAG2O2EBDygQhsqOEEyNL3sxPRMpRX0xLLV0SV6W/a0UKM?=
 =?us-ascii?Q?qO7tb7oXHy4pbFAiuIv8nf4g5yctxZ8txilBpOGpqGHpP5/z8Tyv9v3Iw3hX?=
 =?us-ascii?Q?GGyRS3tkvZ+DuydYuAKsJ/W2FTiH/pmTOLwMzW7qNh4LlHr9tuxQOuya1qZG?=
 =?us-ascii?Q?jH5xsu14ogHUPer2np8uppM8wpTYFGfIEQVVAlEjiD3gS6sVp64dVqobVJl+?=
 =?us-ascii?Q?xZzxNQaTZcHhzb9uos4UoLp26+iGoQ8/oD+CF4ma3X7ogUXlJKHRragZeKRm?=
 =?us-ascii?Q?ui1e5yKRfIsVlXHfyl01FdsVH2MKTUnrfVbpkP3Dx2rY6DVDCI4sRhk2nwkT?=
 =?us-ascii?Q?opc2jxiYDyR/jtLa6J5IwHp+HITnPJm4n8ebzHKQbyiSkOuQiqp0DoV1u91/?=
 =?us-ascii?Q?OBc6aiTGiQExSqkes7j/JqtpIB15UYC5YDQPjsA9Rgx7Z7QXvOWWDMtNOqKL?=
 =?us-ascii?Q?OePao/a/7FbFXH8rfok1ahSAx4pDmxBkqS6x4QUCyvcmEJoW/pgf40wvDrON?=
 =?us-ascii?Q?Zmu3RQdEidWbvA09VtToHl9+XPlD4at+88Dx3FZCB1Ew21Fqgo+45J83ipOZ?=
 =?us-ascii?Q?ZUEAfYSCLKCwOx7CG+nrcfumqiPTBcdAUViP81SfTGJxrVMuc2vi+VjQCd47?=
 =?us-ascii?Q?Krtb+fe4IG3Dui/hFpqbGtEqyL0/rGYDG0LMsJp841UFlrFX3hU2EOK5HekO?=
 =?us-ascii?Q?UkqW0aaxdJyLEWl2/P098LLW5d23di7ohwmuiJnyr/PrcQ46s6xwg58S6ZSo?=
 =?us-ascii?Q?JoFoYpIsBogjIX2/1YgSTGp71/MqYd4u36IfWMvsJi69bQ6mLqgzg7PqtLMn?=
 =?us-ascii?Q?E3W6zhIUqQznxbz9Le52bjMI6C4kVPV0sPkeMC4aB4WoeI26sU15SQKy1ACY?=
 =?us-ascii?Q?1n9+PmF4tHcq8SaXmMo25rs5/ug0eSQ78ITBhjYZFJmjMbmyXMPT0ETbZ4wk?=
 =?us-ascii?Q?Tz1GPBxf88kSVG0BU+S7pT7EUrGbm6ptxfP0RAzGnTzYHXoCPvoOLztaLSjT?=
 =?us-ascii?Q?nNSwTZHHEiIs/kQtXriVAmF1OEO4iB3iIdx70EZs2CVPkRk7wulUzaoxdYaU?=
 =?us-ascii?Q?teTsQ+FhMtCgbxLiW9ULOoCmhqG1cb+xCgG3reP8gepOk6/bKQTewK4hOXCZ?=
 =?us-ascii?Q?diZs63cua8p1ySYscaoJvoGWhGaIbONzwh4ucskZATspbKsRlOL6nuLMiDql?=
 =?us-ascii?Q?HCugEAEXHxmP+CAhe9BUAl1JvLcSjWjI5sYtBz9NRa2X5emvBRCuPF+jPG65?=
 =?us-ascii?Q?lQ=3D=3D?=
Content-Type: multipart/related;
	boundary="_006_PN2PR01MB43159CE56C08B73540969B1480C92PN2PR01MB4315INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4315.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dbf0ef6-e047-450f-ed71-08dc91c3e89c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 07:29:38.6924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YCnKl/WvhJOQzWQML52ga3B7aqSTS7/ikHuqGjsPtnL7lwMbjM8qysrRUlWEWXQme3sun0RmNYn34tNbprpNi1DjCe4//1fFQorCQezc5D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6467
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
Cc: Thangaraj S <Thangaraj.S@Ltts.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Lalit Kumar <Lalit.Kumar2@ltts.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_006_PN2PR01MB43159CE56C08B73540969B1480C92PN2PR01MB4315INDP_
Content-Type: multipart/alternative;
	boundary="_000_PN2PR01MB43159CE56C08B73540969B1480C92PN2PR01MB4315INDP_"

--_000_PN2PR01MB43159CE56C08B73540969B1480C92PN2PR01MB4315INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Thanks for the reply,

Could you please suggest an approach to way forward.

Below are the requirements.

  1.
BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.
  2.
Send/Receive IPMI commands through IPMITOOL<https://github.com/openbmc/ipmi=
tool/>.
  3.
Send/Receive SDR, SEL logs between two BMC's.


Thanks, and regards,
Bala Subramaniyan M.



[cid:c0cbe0bc-b674-45a4-9cc5-477a0a219193]<https://www.ltts.com/>


S1 Building, L&T Tech Park, Bellary Road,

Next to Raintree Boulevard, Park View Layout,

Byatarayanapura, Bengaluru-560092

Mobile: +91 9677035467

ENGINEERING THE CHANGE | www.LTTS.com<https://www.ltts.com/>



________________________________
From: Alexander A. Filippov <a.filippov@yadro.com>
Sent: Thursday, June 20, 2024 9:09 PM
To: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
Cc: Alexander A. Filippov <a.filippov@yadro.com>; openbmc@lists.ozlabs.org =
<openbmc@lists.ozlabs.org>; Thangaraj S <Thangaraj.S@Ltts.com>; Lalit Kumar=
 <Lalit.Kumar2@ltts.com>
Subject: Re: Help with IPMB (IPMI over I2C).

CAUTION: This email is from an external source. Please do not open attachme=
nts or click links from an unknown or suspicious origin. Phishing attempts =
can be reported by using the report message button in Outlook or sending th=
em as an attachment to phishing@Ltts.com. Thank you

On Thu, Jun 20, 2024 at 01:29:18PM +0000, Bala Subramaniyan wrote:
> Hi Alexander,
>
> Thanks for your reply,
>
> ipmitool has raw and i2c commands.
>
> Commands:
>         raw           Send a RAW IPMI request and print response
>         i2c           Send an I2C Master Write-Read command and print res=
ponse
>         spd           Print SPD info from remote I2C device
>         lan           Configure LAN Channels
>
>
> As, I can see ipmi_rawi2c_main() function under ipmitool/lib/ipmi_raw.c<h=
ttps://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.c=
om%2Fopenbmc%2Fipmitool%2Fblob%2Fmaster%2Flib%2Fipmi_raw.c&data=3D05%7C02%7=
CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b3378=
8e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744765697%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7=
C%7C%7C&sdata=3DsQIaT9zo8mKDtWbF8KdZnyf35jn%2B%2FBPlEwrh0tL9rV0%3D&reserved=
=3D0> which is handling I2C Master Read-Write functionality.
>
> Can you please guide us on this, Whether we can use this to perform BMC-t=
o-BMC communication.
>
> Below is the error i'm getting while performing BMC-to-BMC Master-Slave R=
ead-Write by connecting two i2c buses between the boards.
> root@ast2600-default:~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31 0x=
32 0x33 0x34
> ipmi_master_write_read: rsp_value:6207408, LineNo:104
> I2C Master Write-Read command failed: Invalid command
> ipmi_rawi2c_main: rsp_value:0, LineNo:264
> Unable to perform I2C Master Write-Read
>


This command doesn't define a transport for the IPMI command. It asks a rem=
ote
system to write specified bytes and read an answer via i2c bus on that remo=
te
system. And ipmitool uses the default interface (or specified one via `-I`
option) for this command.

As I understood Your first message, You are looking for a transport interfa=
ce
working via i2c, and I don't know the such implementations.

It should be something that You can specify via `-I` option of ipmitool.
By default ipmitool in OpenBMC uses `dbus` as the transport.


> Thanks, and regards,
> Bala Subramaniyan M,
>
>
>
>
> [cid:8c0f8170-e1d0-4031-a57d-20b6a72ccf58]<https://ind01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala=
.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4=
b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744773561%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%=
7C&sdata=3DGc47QOZGRP5O7K8T23JYBjkHqMzjFMsR88ecfygbq%2Fg%3D&reserved=3D0>
>
>
> S1 Building, L&T Tech Park, Bellary Road,
>
> Next to Raintree Boulevard, Park View Layout,
>
> Byatarayanapura, Bengaluru-560092
>
> Mobile: +91 9677035467
>
> ENGINEERING THE CHANGE | https://ind01.safelinks.protection.outlook.com/?=
url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltt=
s.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a=
%7C0%7C0%7C638544947744779111%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DLZgcENCI=
1k8SHeyxdJyux593EPlJ76bzUuIC%2B4wPahs%3D&reserved=3D0<https://ind01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C=
02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b=
33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744783277%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C0%7C%7C%7C&sdata=3DN2hXDj4XNNY2k4M83fPv6uR6X7XXUNFySYhMlOk%2F8SI%3D&reserv=
ed=3D0><http://www.ltts.com/>
>
>
>
> ________________________________
> From: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
> Sent: Thursday, June 20, 2024 6:55 PM
> To: Alexander A. Filippov <a.filippov@yadro.com>
> Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; Thangaraj S <Tha=
ngaraj.S@Ltts.com>; Lalit Kumar <Lalit.Kumar2@ltts.com>
> Subject: Re: Help with IPMB (IPMI over I2C).
>
> Hi Alexander,
>
> Thanks for your reply,
>
> ipmitool has raw and i2c commands, Please refer below image.
>
> [cid:87b5aef4-9628-47c7-b7d4-b714b7a92869]
>
> As, I can see ipmi_rawi2c_main() function under ipmitool/lib/ipmi_raw.c<h=
ttps://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.c=
om%2Fopenbmc%2Fipmitool%2Fblob%2Fmaster%2Flib%2Fipmi_raw.c&data=3D05%7C02%7=
CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b3378=
8e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744787269%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7=
C%7C%7C&sdata=3DWeGkVBWE2vqryoJ%2BpzbTeHJJUWtSpBgZtMsl5KtUP5Y%3D&reserved=
=3D0> which is handling I2C Master Read-Write functionality.
>
> Can you please guide us on this, Whether we can use this to perform BMC-t=
o-BMC communication.
>
> Below is the error i'm getting while performing BMC-to-BMC Master-Slave R=
ead-Write by connecting two i2c buses between the boards.
> root@ast2600-default:~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31 0x=
32 0x33 0x34
> ipmi_master_write_read: rsp_value:6207408, LineNo:104
> I2C Master Write-Read command failed: Invalid command
> ipmi_rawi2c_main: rsp_value:0, LineNo:264
> Unable to perform I2C Master Write-Read
>
>
> Thanks, and regards,
> Bala Subramaniyan M,
>
>
>
> [cid:08db76b7-f643-4b96-8acd-5325e19c1e99]<https://ind01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala=
.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4=
b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744791162%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%=
7C&sdata=3D1GSmh1Pl%2BuTiSBMC7gGRqJtfklIzGmZ%2FSo%2FH3WOc4p0%3D&reserved=3D=
0>
>
>
> S1 Building, L&T Tech Park, Bellary Road,
>
> Next to Raintree Boulevard, Park View Layout,
>
> Byatarayanapura, Bengaluru-560092
>
> Mobile: +91 9677035467
>
> ENGINEERING THE CHANGE | https://ind01.safelinks.protection.outlook.com/?=
url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltt=
s.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a=
%7C0%7C0%7C638544947744795243%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dp%2B7igJ=
mYz8u%2Br8WSr3Q5tQsyOgIjyqAV6dvmGBvfFq8%3D&reserved=3D0<https://ind01.safel=
inks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%=
7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C31=
1b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744798940%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C0%7C%7C%7C&sdata=3DHyR%2Bcna4eZOvzQN5x7FqYP9UQesECVGIAPnnaoi6H84%3D&rese=
rved=3D0><http://www.ltts.com/>
>
>
>
> ________________________________
> From: Alexander A. Filippov <a.filippov@yadro.com>
> Sent: Thursday, June 20, 2024 6:06 PM
> To: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
> Cc: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>; Thangaraj S <Tha=
ngaraj.S@Ltts.com>; Lalit Kumar <Lalit.Kumar2@ltts.com>
> Subject: Re: Help with IPMB (IPMI over I2C).
>
> CAUTION: This email is from an external source. Please do not open attach=
ments or click links from an unknown or suspicious origin. Phishing attempt=
s can be reported by using the report message button in Outlook or sending =
them as an attachment to phishing@Ltts.com. Thank you
>
> On Thu, Jun 20, 2024 at 10:43:59AM +0000, Bala Subramaniyan wrote:
> > Hi All,
>
> Hi,
>
> >
> > For one of our requirement (BMC to BMC, IPMI over I2C), We're exploring=
 with IPMITOOL<https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&data=3D05%7C02%7CBala.Subramaniyan%=
40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8=
ba60a%7C0%7C0%7C638544947744802984%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DGC0=
2wwEeHQ9qpASA0c0I2t%2BjSMlHz9ZRq%2Bfpxy%2FapmM%3D&reserved=3D0<https://ind0=
1.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbm=
c%2Fipmitool&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946=
fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C63854494774=
4806939%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D82y7wAToBrDfZIkZRezCoQxzpxzqhY=
pQO3Y55AifF9c%3D&reserved=3D0<https://github.com/openbmc/ipmitool>>>.
> >
> > Development Board: ASPEED AST2600 EVB
> >
> > Could you please suggest us how to proceed further with our below requi=
rement.
> >
> >   1.
> > BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.
> >   2.
> > Send/Receive IPMI commands through IPMITOOL<https://ind01.safelinks.pro=
tection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&da=
ta=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2=
bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744811172%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C0%7C%7C%7C&sdata=3D7qPcq%2FNzNZcT3HkPzYt%2FT1TUOAPSuiDJN1qE1JX9L=
1E%3D&reserved=3D0<https://ind01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&data=3D05%7C02%7CBala.Subramani=
yan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80=
a3d8ba60a%7C0%7C0%7C638544947744814924%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=
=3D%2F%2Fj8xGUvk6inxfHDTnABEsTV9sKo9cKp5AGJ4QggwqU%3D&reserved=3D0<https://=
github.com/openbmc/ipmitool>>> from one BMC to other.
> >   3.
> > Send/Receive SDR, SEL logs between two BMC's.
> >
> > Any help would be highly appreciated.
> >
> >
>
> As I can see, ipmitool has no any interfaces using i2c directly and I nev=
er
> listen about using i2c as the ipmi transport.
>
> Google shows me that the similar question already exists and answered:
>   https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Fipmitool%2Fipmitool%2Fdiscussions%2F296&data=3D05%7C02%7CBala.Sub=
ramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea=
33fe80a3d8ba60a%7C0%7C0%7C638544947744818379%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&s=
data=3DV7u1FjjwCPOAFEFIZ0BAZPTvBnXAAvJ5V%2B%2BjZU37fDw%3D&reserved=3D0<http=
s://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%=
2Fipmitool%2Fipmitool%2Fdiscussions%2F296&data=3D05%7C02%7CBala.Subramaniya=
n%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3=
d8ba60a%7C0%7C0%7C638544947744821873%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dp=
ruQV4OVTvDxqgq94AH7erS0pxVinHfjAqlW9%2BJ2x78%3D&reserved=3D0><https://githu=
b.com/ipmitool/ipmitool/discussions/296>
>
> As an alternative, You could use lan/lanplus interfaces to communicate wi=
th
> remote BMC via ethernet.
>
>
> >
> > Thanks, and regards,
> > Bala Subramaniyan M,
> >
> >
> >
> > [cid:59c4f387-285c-4c0f-ada0-09714ca611a9]<https://ind01.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBa=
la.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8=
a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744825423%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7=
C%7C&sdata=3DmEPJ1NiBT0nIBtqH6CymCHrswmHBhb3UGXUC813RCs8%3D&reserved=3D0>
> >
> >
> > S1 Building, L&T Tech Park, Bellary Road,
> >
> > Next to Raintree Boulevard, Park View Layout,
> >
> > Byatarayanapura, Bengaluru-560092
> >
> > Mobile: +91 9677035467
> >
> > ENGINEERING THE CHANGE | https://ind01.safelinks.protection.outlook.com=
/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40l=
tts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba6=
0a%7C0%7C0%7C638544947744829092%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DGdWTZ3=
4APtITjhplTyz5f1LxZdDmpOyaO%2BjMUzI9h%2FA%3D&reserved=3D0<https://ind01.saf=
elinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&data=3D0=
5%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C=
311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744832693%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C0%7C%7C%7C&sdata=3DT%2FKaZ6o4M%2FgeBuakvxFI9Fp84n1ISXCU%2FJyGKYOXfBc%3=
D&reserved=3D0><https://ind01.safelinks.protection.outlook.com/?url=3Dhttp%=
3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C233=
1d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C=
638544947744836436%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dw1Jmk1S8WEt5nfTAgWC=
8xmdJ%2BsPCANJvV7j5oSst%2FTE%3D&reserved=3D0><http://www.ltts.com/>
> >
> >
> >
> > [Ltts.com]
> >
> > L&T Technology Services Ltd
> >
> > https://ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.=
ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946f=
c9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744=
840097%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DVaMxCES6V7qlsf6nEd3EjQt9Z6XJQDZ=
yCRWc8xWRPYM%3D&reserved=3D0<https://ind01.safelinks.protection.outlook.com=
/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40l=
tts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba6=
0a%7C0%7C0%7C638544947744843870%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DvGwyZ9=
JiQL8rq84V4cyFUF6oq8zgk%2FuY1BWFU%2BhiRZk%3D&reserved=3D0><http://www.ltts.=
com/>
> >
> > L&T Technology Services Limited (LTTS) is committed to safeguard your p=
rivacy. Read the appropriate privacy notice<https://ind01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fprivacy-policies-notice=
s&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc9=
13f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744847397%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DlG2z6dFm80s0oZRXtyv5pmi43S%2BcX9bxaooU%2F=
O1zAlo%3D&reserved=3D0<https://ind01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fwww.ltts.com%2Fprivacy-policies-notices&data=3D05%7C02%7CB=
ala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e=
8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744851086%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%=
7C%7C&sdata=3Dy%2BMMmKKFtM%2By06EH9iC2rM39IKsg2GKeqT21%2FzC4MtY%3D&reserved=
=3D0<https://www.ltts.com/privacy-policies-notices>>> applicable to you to =
know more about how LTTS collects, uses and stores your personal data. Plea=
se visit our privacy policy<https://ind01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fdata-privacy-policy&data=3D05%7C02%7CBa=
la.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8=
a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744854952%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7=
C%7C&sdata=3D6lXolxhbmqyKJsTFXqmuJBB3y4H%2BqPViYwCipoTGgPY%3D&reserved=3D0<=
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltt=
s.com%2Fdata-privacy-policy&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7=
C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C=
0%7C638544947744858658%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DG02ipd8nDw%2FgI=
UbNhbF9X%2FlDdVLEu6PED8Vs1X%2Bf3%2FI%3D&reserved=3D0<https://www.ltts.com/d=
ata-privacy-policy>>> available on our website https://ind01.safelinks.prot=
ection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&data=3D05%7C02%7CBal=
a.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a=
4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744862422%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C=
%7C&sdata=3DWNmcpxHSxuE%2B3QyPQDWIA%2Bg%2FB2heNLkU54e%2FB5yujr0%3D&reserved=
=3D0<https://ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww=
.ltts.com%2F&data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946=
fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C63854494774=
4866461%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI=
6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dk7gVerT9KSOp7enKmThxwY4ztDa3dm=
fVpkxPkaHR39o%3D&reserved=3D0><http://www.ltts.com/> for more information a=
bout our commitment towards data privacy under applicable data protection l=
aws. This email may contain confidential or privileged information for the =
intended recipient(s). If you are not the intended recipient, please do not=
 use or disseminate the information, notify the sender and delete it from y=
our system.

--
Regads,
Alexander Filippov

--_000_PN2PR01MB43159CE56C08B73540969B1480C92PN2PR01MB4315INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Alexander,</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Thanks for the reply,</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Could you please suggest an approach to way forward.</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Below are the requirements.&nbsp;</div>
<ol start=3D"1">
<li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; co=
lor: rgb(0, 0, 0);">
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Send/Receive IPMI commands through <a href=3D"https://github.com/openbmc/ip=
mitool/" id=3D"LPlnk161201" title=3D"https://github.com/openbmc/ipmitool/">
IPMITOOL</a>.</div>
</li><li style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);">
<div class=3D"elementToProof" style=3D"margin: 0px; font-family: Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Send/Receive SDR, SEL logs between two BMC's.</div>
</li></ol>
<div id=3D"Signature">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Thanks, and regards,</b></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Bala Subramaniyan M.</b></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span><img id=3D"Picture_x0020_12" width=3D"330" height=3D"2" style=3D"widt=
h: 330px; height: 2px; max-width: 728px; margin-top: 0px; margin-bottom: 0p=
x;" data-outlook-trace=3D"F:1|T:1" src=3D"cid:aec79c95-1026-4c2e-86b6-6fb52=
8c3ca42"></span></div>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><br>
</span></p>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><a href=3D"https://www.ltts.com/" id=3D"OWA42b0961=
6-d050-28b6-64a7-bc34f0b565c8" class=3D"OWAAutoLink" style=3D"color: rgb(0,=
 0, 0); margin-top: 0px; margin-bottom: 0px;"><img id=3D"Graphic_x0020_2" w=
idth=3D"249" height=3D"38" style=3D"width: 249px; height: 38px; max-width: =
728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F:1|T:1"=
 src=3D"cid:c0cbe0bc-b674-45a4-9cc5-477a0a219193"></a></span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;"><b=
r>
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">S1=
 Building, L&amp;T Tech Park, Bellary Road,
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">Ne=
xt to Raintree Boulevard, Park View Layout,
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">By=
atarayanapura, Bengaluru-560092</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">Mo=
bile: +91 9677035467</span></p>
<p style=3D"line-height: 150%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(13, 13, 13); line-height: 150%;"=
>ENGINEERING<b> THE CHANGE</b></span><span style=3D"font-family: Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 150%=
;">
 | </span><span style=3D"font-family: Arial, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(13, 13, 13); line-height: 150%;"><a href=3D"https://ww=
w.ltts.com/" id=3D"OWA36252a0b-cad1-e4b3-b276-8cd0b897dd6d" class=3D"OWAAut=
oLink" style=3D"color: rgb(13, 13, 13); margin-top: 0px; margin-bottom: 0px=
;">www.LTTS.com</a></span></p>
<p style=3D"line-height: 150%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><img id=3D"Picture_x0=
020_12" width=3D"330" height=3D"2" style=3D"width: 330px; height: 2px; max-=
width: 728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F=
:1|T:1" src=3D"cid:7755f6ae-506a-4c33-a031-d6c4f802bb0e"></span></p>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alexander A. Filippov=
 &lt;a.filippov@yadro.com&gt;<br>
<b>Sent:</b> Thursday, June 20, 2024 9:09 PM<br>
<b>To:</b> Bala Subramaniyan &lt;Bala.Subramaniyan@Ltts.com&gt;<br>
<b>Cc:</b> Alexander A. Filippov &lt;a.filippov@yadro.com&gt;; openbmc@list=
s.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; Thangaraj S &lt;Thangaraj.S@=
Ltts.com&gt;; Lalit Kumar &lt;Lalit.Kumar2@ltts.com&gt;<br>
<b>Subject:</b> Re: Help with IPMB (IPMI over I2C).</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email is from an external source. Pl=
ease do not open attachments or click links from an unknown or suspicious o=
rigin. Phishing attempts can be reported by using the report message button=
 in Outlook or sending them as an
 attachment to phishing@Ltts.com. Thank you<br>
<br>
On Thu, Jun 20, 2024 at 01:29:18PM +0000, Bala Subramaniyan wrote:<br>
&gt; Hi Alexander,<br>
&gt;<br>
&gt; Thanks for your reply,<br>
&gt;<br>
&gt; ipmitool has raw and i2c commands.<br>
&gt;<br>
&gt; Commands:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; raw&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Send a RAW IPMI request and print=
 response<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i2c&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Send an I2C Master Write-Read com=
mand and print response<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spd&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Print SPD info from remote I2C de=
vice<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lan&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Configure LAN Channels<br>
&gt;<br>
&gt;<br>
&gt; As, I can see ipmi_rawi2c_main() function under ipmitool/lib/ipmi_raw.=
c&lt;https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
thub.com%2Fopenbmc%2Fipmitool%2Fblob%2Fmaster%2Flib%2Fipmi_raw.c&amp;data=
=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc=
6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744765697%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DsQIaT9zo8mKDtWbF8KdZnyf35jn%2B%2FBPlEwrh0tL=
9rV0%3D&amp;reserved=3D0&gt;
 which is handling I2C Master Read-Write functionality.<br>
&gt;<br>
&gt; Can you please guide us on this, Whether we can use this to perform BM=
C-to-BMC communication.<br>
&gt;<br>
&gt; Below is the error i'm getting while performing BMC-to-BMC Master-Slav=
e Read-Write by connecting two i2c buses between the boards.<br>
&gt; root@ast2600-default:~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31=
 0x32 0x33 0x34<br>
&gt; ipmi_master_write_read: rsp_value:6207408, LineNo:104<br>
&gt; I2C Master Write-Read command failed: Invalid command<br>
&gt; ipmi_rawi2c_main: rsp_value:0, LineNo:264<br>
&gt; Unable to perform I2C Master Write-Read<br>
&gt;<br>
<br>
<br>
This command doesn't define a transport for the IPMI command. It asks a rem=
ote<br>
system to write specified bytes and read an answer via i2c bus on that remo=
te<br>
system. And ipmitool uses the default interface (or specified one via `-I`<=
br>
option) for this command.<br>
<br>
As I understood Your first message, You are looking for a transport interfa=
ce<br>
working via i2c, and I don't know the such implementations.<br>
<br>
It should be something that You can specify via `-I` option of ipmitool.<br=
>
By default ipmitool in OpenBMC uses `dbus` as the transport.<br>
<br>
<br>
&gt; Thanks, and regards,<br>
&gt; Bala Subramaniyan M,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; [cid:8c0f8170-e1d0-4031-a57d-20b6a72ccf58]&lt;https://ind01.safelinks.=
protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&amp;data=3D05%7=
C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311=
b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744773561%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C0%7C%7C%7C&amp;sdata=3DGc47QOZGRP5O7K8T23JYBjkHqMzjFMsR88ecfygbq%2Fg%3D&a=
mp;reserved=3D0&gt;<br>
&gt;<br>
&gt;<br>
&gt; S1 Building, L&amp;T Tech Park, Bellary Road,<br>
&gt;<br>
&gt; Next to Raintree Boulevard, Park View Layout,<br>
&gt;<br>
&gt; Byatarayanapura, Bengaluru-560092<br>
&gt;<br>
&gt; Mobile: +91 9677035467<br>
&gt;<br>
&gt; ENGINEERING THE CHANGE | <a href=3D"http://www.ltts.com/">https://ind0=
1.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&amp;=
data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913=
f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744779111%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DLZgcENCI1k8SHeyxdJyux593EPlJ76bzUuIC%2B=
4wPahs%3D&amp;reserved=3D0&lt;https://ind01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&amp;data=3D05%7C02%7CBala.Subramaniy=
an%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a=
3d8ba60a%7C0%7C0%7C638544947744783277%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdat=
a=3DN2hXDj4XNNY2k4M83fPv6uR6X7XXUNFySYhMlOk%2F8SI%3D&amp;reserved=3D0&gt;</=
a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Bala Subramaniyan &lt;Bala.Subramaniyan@Ltts.com&gt;<br>
&gt; Sent: Thursday, June 20, 2024 6:55 PM<br>
&gt; To: Alexander A. Filippov &lt;a.filippov@yadro.com&gt;<br>
&gt; Cc: openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; Thangar=
aj S &lt;Thangaraj.S@Ltts.com&gt;; Lalit Kumar &lt;Lalit.Kumar2@ltts.com&gt=
;<br>
&gt; Subject: Re: Help with IPMB (IPMI over I2C).<br>
&gt;<br>
&gt; Hi Alexander,<br>
&gt;<br>
&gt; Thanks for your reply,<br>
&gt;<br>
&gt; ipmitool has raw and i2c commands, Please refer below image.<br>
&gt;<br>
&gt; [cid:87b5aef4-9628-47c7-b7d4-b714b7a92869]<br>
&gt;<br>
&gt; As, I can see ipmi_rawi2c_main() function under ipmitool/lib/ipmi_raw.=
c&lt;https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
thub.com%2Fopenbmc%2Fipmitool%2Fblob%2Fmaster%2Flib%2Fipmi_raw.c&amp;data=
=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc=
6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744787269%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DWeGkVBWE2vqryoJ%2BpzbTeHJJUWtSpBgZtMsl5KtUP=
5Y%3D&amp;reserved=3D0&gt;
 which is handling I2C Master Read-Write functionality.<br>
&gt;<br>
&gt; Can you please guide us on this, Whether we can use this to perform BM=
C-to-BMC communication.<br>
&gt;<br>
&gt; Below is the error i'm getting while performing BMC-to-BMC Master-Slav=
e Read-Write by connecting two i2c buses between the boards.<br>
&gt; root@ast2600-default:~# ipmitool i2c bus=3D14 0x12 0x00 0x00 0x00 0x31=
 0x32 0x33 0x34<br>
&gt; ipmi_master_write_read: rsp_value:6207408, LineNo:104<br>
&gt; I2C Master Write-Read command failed: Invalid command<br>
&gt; ipmi_rawi2c_main: rsp_value:0, LineNo:264<br>
&gt; Unable to perform I2C Master Write-Read<br>
&gt;<br>
&gt;<br>
&gt; Thanks, and regards,<br>
&gt; Bala Subramaniyan M,<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; [cid:08db76b7-f643-4b96-8acd-5325e19c1e99]&lt;https://ind01.safelinks.=
protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&amp;data=3D05%7=
C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311=
b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744791162%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C0%7C%7C%7C&amp;sdata=3D1GSmh1Pl%2BuTiSBMC7gGRqJtfklIzGmZ%2FSo%2FH3WOc4p0%=
3D&amp;reserved=3D0&gt;<br>
&gt;<br>
&gt;<br>
&gt; S1 Building, L&amp;T Tech Park, Bellary Road,<br>
&gt;<br>
&gt; Next to Raintree Boulevard, Park View Layout,<br>
&gt;<br>
&gt; Byatarayanapura, Bengaluru-560092<br>
&gt;<br>
&gt; Mobile: +91 9677035467<br>
&gt;<br>
&gt; ENGINEERING THE CHANGE | <a href=3D"http://www.ltts.com/">https://ind0=
1.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&amp;=
data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913=
f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744795243%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Dp%2B7igJmYz8u%2Br8WSr3Q5tQsyOgIjyqAV6dv=
mGBvfFq8%3D&amp;reserved=3D0&lt;https://ind01.safelinks.protection.outlook.=
com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&amp;data=3D05%7C02%7CBala.Subraman=
iyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe8=
0a3d8ba60a%7C0%7C0%7C638544947744798940%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sd=
ata=3DHyR%2Bcna4eZOvzQN5x7FqYP9UQesECVGIAPnnaoi6H84%3D&amp;reserved=3D0&gt;=
</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Alexander A. Filippov &lt;a.filippov@yadro.com&gt;<br>
&gt; Sent: Thursday, June 20, 2024 6:06 PM<br>
&gt; To: Bala Subramaniyan &lt;Bala.Subramaniyan@Ltts.com&gt;<br>
&gt; Cc: openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;; Thangar=
aj S &lt;Thangaraj.S@Ltts.com&gt;; Lalit Kumar &lt;Lalit.Kumar2@ltts.com&gt=
;<br>
&gt; Subject: Re: Help with IPMB (IPMI over I2C).<br>
&gt;<br>
&gt; CAUTION: This email is from an external source. Please do not open att=
achments or click links from an unknown or suspicious origin. Phishing atte=
mpts can be reported by using the report message button in Outlook or sendi=
ng them as an attachment to phishing@Ltts.com.
 Thank you<br>
&gt;<br>
&gt; On Thu, Jun 20, 2024 at 10:43:59AM +0000, Bala Subramaniyan wrote:<br>
&gt; &gt; Hi All,<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; For one of our requirement (BMC to BMC, IPMI over I2C), We're exp=
loring with IPMITOOL&lt;<a href=3D"https://github.com/openbmc/ipmitool">htt=
ps://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com=
%2Fopenbmc%2Fipmitool&amp;data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2=
331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%=
7C638544947744802984%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DGC02wwEeHQ9qp=
ASA0c0I2t%2BjSMlHz9ZRq%2Bfpxy%2FapmM%3D&amp;reserved=3D0&lt;https://ind01.s=
afelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2=
Fipmitool&amp;data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a294=
6fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C6385449477=
44806939%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D82y7wAToBrDfZIkZRezCoQxzp=
xzqhYpQO3Y55AifF9c%3D&amp;reserved=3D0</a>&gt;&gt;.<br>
&gt; &gt;<br>
&gt; &gt; Development Board: ASPEED AST2600 EVB<br>
&gt; &gt;<br>
&gt; &gt; Could you please suggest us how to proceed further with our below=
 requirement.<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp; 1.<br>
&gt; &gt; BMC to BMC (IPMI over I2C), One BMC as Master and other as slave.=
<br>
&gt; &gt;&nbsp;&nbsp; 2.<br>
&gt; &gt; Send/Receive IPMI commands through IPMITOOL&lt;<a href=3D"https:/=
/github.com/openbmc/ipmitool">https://ind01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&amp;data=3D05%7C02%7=
CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b3378=
8e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744811172%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7=
C%7C%7C&amp;sdata=3D7qPcq%2FNzNZcT3HkPzYt%2FT1TUOAPSuiDJN1qE1JX9L1E%3D&amp;=
reserved=3D0&lt;https://ind01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fgithub.com%2Fopenbmc%2Fipmitool&amp;data=3D05%7C02%7CBala.Subraman=
iyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe8=
0a3d8ba60a%7C0%7C0%7C638544947744814924%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sd=
ata=3D%2F%2Fj8xGUvk6inxfHDTnABEsTV9sKo9cKp5AGJ4QggwqU%3D&amp;reserved=3D0</=
a>&gt;&gt;
 from one BMC to other.<br>
&gt; &gt;&nbsp;&nbsp; 3.<br>
&gt; &gt; Send/Receive SDR, SEL logs between two BMC's.<br>
&gt; &gt;<br>
&gt; &gt; Any help would be highly appreciated.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; As I can see, ipmitool has no any interfaces using i2c directly and I =
never<br>
&gt; listen about using i2c as the ipmi transport.<br>
&gt;<br>
&gt; Google shows me that the similar question already exists and answered:=
<br>
&gt;&nbsp;&nbsp; <a href=3D"https://github.com/ipmitool/ipmitool/discussion=
s/296">https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
github.com%2Fipmitool%2Fipmitool%2Fdiscussions%2F296&amp;data=3D05%7C02%7CB=
ala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e=
8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744818379%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%=
7C%7C&amp;sdata=3DV7u1FjjwCPOAFEFIZ0BAZPTvBnXAAvJ5V%2B%2BjZU37fDw%3D&amp;re=
served=3D0&lt;https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgithub.com%2Fipmitool%2Fipmitool%2Fdiscussions%2F296&amp;data=3D05%7=
C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311=
b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744821873%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C0%7C%7C%7C&amp;sdata=3DpruQV4OVTvDxqgq94AH7erS0pxVinHfjAqlW9%2BJ2x78%3D&a=
mp;reserved=3D0&gt;</a><br>
&gt;<br>
&gt; As an alternative, You could use lan/lanplus interfaces to communicate=
 with<br>
&gt; remote BMC via ethernet.<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks, and regards,<br>
&gt; &gt; Bala Subramaniyan M,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; [cid:59c4f387-285c-4c0f-ada0-09714ca611a9]&lt;https://ind01.safel=
inks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&amp;data=
=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc=
6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744825423%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DmEPJ1NiBT0nIBtqH6CymCHrswmHBhb3UGXUC813RCs8=
%3D&amp;reserved=3D0&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; S1 Building, L&amp;T Tech Park, Bellary Road,<br>
&gt; &gt;<br>
&gt; &gt; Next to Raintree Boulevard, Park View Layout,<br>
&gt; &gt;<br>
&gt; &gt; Byatarayanapura, Bengaluru-560092<br>
&gt; &gt;<br>
&gt; &gt; Mobile: +91 9677035467<br>
&gt; &gt;<br>
&gt; &gt; ENGINEERING THE CHANGE | <a href=3D"http://www.ltts.com/">https:/=
/ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F=
&amp;data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08=
dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744829092%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DGdWTZ34APtITjhplTyz5f1LxZdDmpOyaO%=
2BjMUzI9h%2FA%3D&amp;reserved=3D0&lt;https://ind01.safelinks.protection.out=
look.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2F&amp;data=3D05%7C02%7CBala.Sub=
ramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea=
33fe80a3d8ba60a%7C0%7C0%7C638544947744832693%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&a=
mp;sdata=3DT%2FKaZ6o4M%2FgeBuakvxFI9Fp84n1ISXCU%2FJyGKYOXfBc%3D&amp;reserve=
d=3D0&gt;&lt;https://ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%=
2F%2Fwww.ltts.com%2F&amp;data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C23=
31d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7=
C638544947744836436%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Dw1Jmk1S8WEt5nf=
TAgWC8xmdJ%2BsPCANJvV7j5oSst%2FTE%3D&amp;reserved=3D0&gt;</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; [Ltts.com]<br>
&gt; &gt;<br>
&gt; &gt; L&amp;T Technology Services Ltd<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"http://www.ltts.com/">https://ind01.safelinks.protecti=
on.outlook.com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&amp;data=3D05%7C02%7CBal=
a.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a=
4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744840097%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C=
%7C&amp;sdata=3DVaMxCES6V7qlsf6nEd3EjQt9Z6XJQDZyCRWc8xWRPYM%3D&amp;reserved=
=3D0&lt;https://ind01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2F=
www.ltts.com%2F&amp;data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d00=
69a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C6385=
44947744843870%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DvGwyZ9JiQL8rq84V4cy=
FUF6oq8zgk%2FuY1BWFU%2BhiRZk%3D&amp;reserved=3D0&gt;</a><br>
&gt; &gt;<br>
&gt; &gt; L&amp;T Technology Services Limited (LTTS) is committed to safegu=
ard your privacy. Read the appropriate privacy notice&lt;<a href=3D"https:/=
/www.ltts.com/privacy-policies-notices">https://ind01.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fprivacy-policies-notices&am=
p;data=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc9=
13f2bc6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744847397%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DlG2z6dFm80s0oZRXtyv5pmi43S%2BcX9bxaoo=
U%2FO1zAlo%3D&amp;reserved=3D0&lt;https://ind01.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fprivacy-policies-notices&amp;data=
=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc=
6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744851086%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Dy%2BMMmKKFtM%2By06EH9iC2rM39IKsg2GKeqT21%2F=
zC4MtY%3D&amp;reserved=3D0</a>&gt;&gt;
 applicable to you to know more about how LTTS collects, uses and stores yo=
ur personal data. Please visit our privacy policy&lt;<a href=3D"https://www=
.ltts.com/data-privacy-policy">https://ind01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fwww.ltts.com%2Fdata-privacy-policy&amp;data=3D05%7C=
02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b=
33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744854952%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C0%7C%7C%7C&amp;sdata=3D6lXolxhbmqyKJsTFXqmuJBB3y4H%2BqPViYwCipoTGgPY%3D&am=
p;reserved=3D0&lt;https://ind01.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Fwww.ltts.com%2Fdata-privacy-policy&amp;data=3D05%7C02%7CBala.Sub=
ramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea=
33fe80a3d8ba60a%7C0%7C0%7C638544947744858658%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&a=
mp;sdata=3DG02ipd8nDw%2FgIUbNhbF9X%2FlDdVLEu6PED8Vs1X%2Bf3%2FI%3D&amp;reser=
ved=3D0</a>&gt;&gt;
 available on our website <a href=3D"http://www.ltts.com/">https://ind01.sa=
felinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&amp;data=
=3D05%7C02%7CBala.Subramaniyan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc=
6%7C311b33788e8a4b5ea33fe80a3d8ba60a%7C0%7C0%7C638544947744862422%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DWNmcpxHSxuE%2B3QyPQDWIA%2Bg%2FB2heNLkU54e%2=
FB5yujr0%3D&amp;reserved=3D0&lt;https://ind01.safelinks.protection.outlook.=
com/?url=3Dhttp%3A%2F%2Fwww.ltts.com%2F&amp;data=3D05%7C02%7CBala.Subramani=
yan%40ltts.com%7C2331d0069a2946fc9fcd08dc913f2bc6%7C311b33788e8a4b5ea33fe80=
a3d8ba60a%7C0%7C0%7C638544947744866461%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sda=
ta=3Dk7gVerT9KSOp7enKmThxwY4ztDa3dmfVpkxPkaHR39o%3D&amp;reserved=3D0&gt;</a=
>
 for more information about our commitment towards data privacy under appli=
cable data protection laws. This email may contain confidential or privileg=
ed information for the intended recipient(s). If you are not the intended r=
ecipient, please do not use or disseminate
 the information, notify the sender and delete it from your system.<br>
<br>
--<br>
Regads,<br>
Alexander Filippov<br>
</div>
</span></font></div>
</body>
</html>

--_000_PN2PR01MB43159CE56C08B73540969B1480C92PN2PR01MB4315INDP_--

--_006_PN2PR01MB43159CE56C08B73540969B1480C92PN2PR01MB4315INDP_
Content-Type: image/png; name="Outlook-plmfv3o3.png"
Content-Description: Outlook-plmfv3o3.png
Content-Disposition: inline; filename="Outlook-plmfv3o3.png"; size=99;
	creation-date="Fri, 21 Jun 2024 07:29:38 GMT";
	modification-date="Fri, 21 Jun 2024 07:29:38 GMT"
Content-ID: <aec79c95-1026-4c2e-86b6-6fb528c3ca42>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_006_PN2PR01MB43159CE56C08B73540969B1480C92PN2PR01MB4315INDP_
Content-Type: image/png; name="Outlook-srw23pzd.png"
Content-Description: Outlook-srw23pzd.png
Content-Disposition: inline; filename="Outlook-srw23pzd.png"; size=5482;
	creation-date="Fri, 21 Jun 2024 07:29:38 GMT";
	modification-date="Fri, 21 Jun 2024 07:29:38 GMT"
Content-ID: <c0cbe0bc-b674-45a4-9cc5-477a0a219193>
Content-Transfer-Encoding: base64

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
AABJRU5ErkJggg==

--_006_PN2PR01MB43159CE56C08B73540969B1480C92PN2PR01MB4315INDP_
Content-Type: image/png; name="Outlook-b3hsgxnc.png"
Content-Description: Outlook-b3hsgxnc.png
Content-Disposition: inline; filename="Outlook-b3hsgxnc.png"; size=99;
	creation-date="Fri, 21 Jun 2024 07:29:38 GMT";
	modification-date="Fri, 21 Jun 2024 07:29:38 GMT"
Content-ID: <7755f6ae-506a-4c33-a031-d6c4f802bb0e>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_006_PN2PR01MB43159CE56C08B73540969B1480C92PN2PR01MB4315INDP_--
