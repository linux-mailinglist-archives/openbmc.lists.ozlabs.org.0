Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885A4B2926
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 16:32:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwHgF0HYxz3cDr
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 02:32:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oyIMq8bp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=shawnmm@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oyIMq8bp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwHfr2H0Vz30hm
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 02:32:20 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21BCwQOU012760
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 15:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : references : cc : from :
 in-reply-to; s=pp1; bh=KPbBrZdfcbmfizUTwiZhWi2tCpF4FGtrKS/YwUf7PC4=;
 b=oyIMq8bp8FX9KzAA8+d85iJmCPLVnYnlF+QsKpV5r6H2ppQeU2kzG+LmOoKqEBpKktEC
 U2yU8Az1orwhThWseYIXam2Y4DJ1OKLiPlKdhInfyZyPz/wtHiwJS7OKNpc622aH3bU8
 s1azgLrKr7tJQjsj+aRt2EJ+HCW9jDBkMpqdyMiubklgFLSngJrvPWJs5BqczvNHMj5M
 BPoe0k0TK6E1HTEz1Cp4DWqLQRoXSjtZMUmPk0QGiDqj2gabW5ICxWsG7VZXZO65dLip
 ZdW1TMvLTaBYJBnkEsxSPlbj1NcarUBi+6EcrJa8jht7VnN2VIfY0jGQW/yCcnsb9ChY OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5r9bk53d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 15:32:17 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21BFQq3w009009
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 15:32:16 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5r9bk52x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 15:32:16 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21BFHn1f025132;
 Fri, 11 Feb 2022 15:32:15 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3e5fmhhexk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 15:32:15 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21BFWE0I31588708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 15:32:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAC217806E;
 Fri, 11 Feb 2022 15:32:13 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7C3A78068;
 Fri, 11 Feb 2022 15:32:13 +0000 (GMT)
Received: from [9.211.142.23] (unknown [9.211.142.23])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 15:32:13 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------voScgmwWhExEzzI0ZZtGdHPs"
Message-ID: <1858988f-100f-b3b4-c599-80cddaa7247a@linux.ibm.com>
Date: Fri, 11 Feb 2022 09:32:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: No dbus objects for phosphor-regulators
Content-Language: en-US
To: Mike Jones <proclivis@gmail.com>
References: <9aaceaed-1a8a-6a13-d650-8f4678d267d4@linux.ibm.com>
 <6D1561E1-59FC-4126-9271-A7C8BFDB0B11@gmail.com>
From: Shawn McCarney <shawnmm@linux.ibm.com>
In-Reply-To: <6D1561E1-59FC-4126-9271-A7C8BFDB0B11@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IKsF0XtxfTvo26H5eC1Cdl_GOB9eWeo7
X-Proofpoint-ORIG-GUID: Se8lsSno_q2n0T2lqUXlBvkgnAvX7sGO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_05,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110084
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------voScgmwWhExEzzI0ZZtGdHPs
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2/9/2022 4:30 PM, Mike Jones wrote:
> The journal shows an I2C error: Device or resource busy. Does hwmon=20
> lock out phosphor-regulators if it uses the same address? Sent from my=20
> iPad On Feb 1, 2022, at 10:38 AM, Shawn McCarney=20
> <shawnmm@linux.ibm.com> wrote: =EF=BB=BF =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=
=80=8D =E2=80=8D =E2=80=8D=20
>=20
> The journal shows an I2C error: Device or resource busy.
>
> Does hwmon lock out phosphor-regulators if it uses the same address?
>
phosphor-regulators currently communicates directly with voltage=20
regulators using i2c-dev; it does not use device drivers.

The reason is that most regulator drivers provide either no or very=20
limited ability to configure regulators.=C2=A0 For the systems I work on, w=
e=20
need to do extensive regulator configuration to fine tune things (output=20
voltage, pgood min/max, timing, etc.) Redundant phase fault detection is=20
also pretty device-specific and on involves communicating with multiple=20
devices.

I have not tested using phosphor-regulators when a driver is bound to=20
the regulator, but I suspect you may be right.=C2=A0 I assume hwmon is usin=
g=20
read sensor data from a driver, and the driver being bound is stopping=20
the phosphor-regulators read from succeeding.

Thanks,

Shawn

--------------voScgmwWhExEzzI0ZZtGdHPs
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    On 2/9/2022 4:30 PM, Mike Jones wrote:<br>
    <blockquote type=3D"cite"
      cite=3D"mid:6D1561E1-59FC-4126-9271-A7C8BFDB0B11@gmail.com">
=20=20=20=20=20=20
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
=20=20=20=20=20=20
      The journal shows an I2C error: Device or resource busy.
      <div><br>
      </div>
      <div>Does hwmon lock out phosphor-regulators if it uses the same
        address?<br>
        <br>
      </div>
    </blockquote>
    <p>phosphor-regulators currently communicates directly with voltage
      regulators using i2c-dev; it does not use device drivers.</p>
    <p>The reason is that most regulator drivers provide either no or
      very limited ability to configure regulators.=C2=A0 For the systems I
      work on, we need to do extensive regulator configuration to fine
      tune things (output voltage, pgood min/max, timing, etc.)=C2=A0
      Redundant phase fault detection is also pretty device-specific and
      on involves communicating with multiple devices.<br>
    </p>
    <p>I have not tested using phosphor-regulators when a driver is
      bound to the regulator, but I suspect you may be right.=C2=A0 I assume
      hwmon is using read sensor data from a driver, and the driver
      being bound is stopping the phosphor-regulators read from
      succeeding.<br>
      <br>
      Thanks,</p>
    <p>Shawn<br>
    </p>
  </body>
</html>

--------------voScgmwWhExEzzI0ZZtGdHPs--

