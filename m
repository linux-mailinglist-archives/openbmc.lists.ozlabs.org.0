Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2BE4B29A2
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 17:06:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwJQc575gz3cD3
	for <lists+openbmc@lfdr.de>; Sat, 12 Feb 2022 03:06:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=snhada4S;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=shawnmm@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=snhada4S; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwJQ82ZcBz30hm
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 03:06:23 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21BFqM0D012885
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : references : cc : from :
 in-reply-to; s=pp1; bh=XI742DkSw2YSfWP6QGyDTedx2jWObt0MxWu8QiZWLyo=;
 b=snhada4SCYFRj52aXYkCumwiKHZb8pFSfItqQqjJx7RrIW+A7cdhYj43aC4zGftMbthM
 FUbbm/6vW0l7mf6SP6d4F53PAPWhqpdPAkIrpPx4Emg4/gcuKcxRY9+E1a1pqjEP+2PV
 7RsmIiVFUZOZKINSm6CPBKbMhQ0xxLM0yNnzlY70k/MaKBMGxJvrx9HSJ6yJxtlZlEVU
 PvH8+MA2OhBYAmDnKHpKKbYkvppwOTqrJsUJHxYqNpd9VWx77YAM92CIJcG+hHKmExnc
 3103LNGx6qGuSp1cDqhfJhTDphezDhbiZpY3jJ1oiATTNbn6ARBUlv0BItpaFdEbLbcN vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5r9bkw6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:06:21 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21BFsvcd017939
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 16:06:21 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5r9bkw67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 16:06:21 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21BFwIZW029719;
 Fri, 11 Feb 2022 16:06:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 3e1gvddvfx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 16:06:20 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21BG6IH231064396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 16:06:19 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D834378063;
 Fri, 11 Feb 2022 16:06:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A045178066;
 Fri, 11 Feb 2022 16:06:18 +0000 (GMT)
Received: from [9.211.142.23] (unknown [9.211.142.23])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 16:06:18 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------UdeY1ZD5LrlV9WDo2XrFBSVI"
Message-ID: <5d8e7a32-667e-be32-3c01-160e5bd6b4a1@linux.ibm.com>
Date: Fri, 11 Feb 2022 10:06:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: No dbus objects for phosphor-regulators
Content-Language: en-US
To: Mike Jones <proclivis@gmail.com>
References: <9aaceaed-1a8a-6a13-d650-8f4678d267d4@linux.ibm.com>
 <6D1561E1-59FC-4126-9271-A7C8BFDB0B11@gmail.com>
 <1858988f-100f-b3b4-c599-80cddaa7247a@linux.ibm.com>
 <DCAD9B4C-D047-40A0-B4AD-1D21C0CF6197@gmail.com>
From: Shawn McCarney <shawnmm@linux.ibm.com>
In-Reply-To: <DCAD9B4C-D047-40A0-B4AD-1D21C0CF6197@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: g_8ke9NH2Pj3ZxET2KDSHkfbBOqOoYNT
X-Proofpoint-ORIG-GUID: RYQWRnVeM4wlmNSKqcxT535O1Ct5SlCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_05,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110088
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
--------------UdeY1ZD5LrlV9WDo2XrFBSVI
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2/11/2022 9:42 AM, Mike Jones wrote:
> Shawn, I was mainly surprised because a conversation I had with=20
> Guenter, if I remember correctly, suggested that /dev/i2c calls from=20
> user space work with hwmon, because hwmon does not lock the i2c except=20
> when using it. So I assumed that in this=20
> I was mainly surprised because a conversation I had with Guenter, if I=20
> remember correctly, suggested that /dev/i2c calls from user space work=20
> with hwmon, because hwmon does not lock the i2c except when using it.
>
> So I assumed that in this case, it was the polling of hwmon that was=20
> just keeping it locked enough to conflict with phosphor-regulators and=20
> then it gives up.

With i2c-dev, you can specify I2C_SLAVE or I2C_SLAVE_FORCE when creating=20
the connection.=C2=A0 I believe I2C_SLAVE will cause communication attempts=
=20
to fail if a driver is bound. I2C_SLAVE_FORCE will still try to communicate.

I wanted to take the more conservative approach, because there are=20
scenarios where interleaving communication can cause serious problems.=C2=
=A0=20
For example, if one PMBus regulator supports multiple rails, you have to=20
set the PMBus PAGE register to the rail you are interested in.=C2=A0=20
Subsequent PMBus commands will affect that rail. If phosphor-regulators=20
and a driver are both communicating with the regulator, they may both be=20
setting PAGE and thus their subsequent commands are going to the wrong rail.

>
> I could just not use hwmon at all use phosphor-regulators for all=20
> telemetry, but this seemed like more work.
>
Sorry about that.=C2=A0 I think if you have already done the work of defini=
ng=20
the regulator and a read sensors rule in your JSON file, adding a few=20
more sensors is not much additional work though.=C2=A0 Let me know if you=20
have questions.

> Also, I will need to figure out how to connect phosphor-regulators=20
> telemetry to Redfish and the WebUI. Are there examples of how to do that?
It should just work with no additional effort as long as you define the=20
following correctly in your JSON file:

* The "inventory_path" property of your "chassis" object needs to match=20
a real chassis inventory item on D-Bus.

* The "fru" property of your regulator "device" object needs to match a=20
real inventory item on D-Bus.=C2=A0 As I mentioned earlier, normally if the=
=20
regulator is pluggable then this is the regulator itself.=C2=A0 Otherwise i=
t=20
is the larger hardware item that contains it, such as a motherboard.=C2=A0=
=20
FRU is the acronym for Field Replaceable Unit, referring to a pluggable=20
hardware item.

phosphor-regulators will publish your sensors on D-Bus with the standard=20
object paths and properties.=C2=A0 The two JSON properties above are used t=
o=20
define a "chassis" association and an "inventory_item" association on=20
D-Bus that is used by bmcweb. This will cause your sensors to appear in=20
Redfish and the Web UI.

Thanks,

Shawn

--------------UdeY1ZD5LrlV9WDo2XrFBSVI
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2/11/2022 9:42 AM, Mike Jones wrote:<=
br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:DCAD9B4C-D047-40A0-B4AD-1D21C0CF6197@gmail.com">
=20=20=20=20=20=20
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
      I was mainly surprised because a
      conversation I had with Guenter, if I remember correctly,
      suggested that /dev/i2c calls from user space work with hwmon,
      because hwmon does not lock the i2c except when using it.
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D"">So I assumed that in this case, it was the polling
        of hwmon that was just keeping it locked enough to conflict with
        phosphor-regulators and then it gives up.</div>
    </blockquote>
    <p>With i2c-dev, you can specify I2C_SLAVE or I2C_SLAVE_FORCE when
      creating the connection.=C2=A0 I believe I2C_SLAVE will cause
      communication attempts to fail if a driver is bound.=C2=A0
      I2C_SLAVE_FORCE will still try to communicate.</p>
    <p>I wanted to take the more conservative approach, because there
      are scenarios where interleaving communication can cause serious
      problems.=C2=A0 For example, if one PMBus regulator supports multiple
      rails, you have to set the PMBus PAGE register to the rail you are
      interested in.=C2=A0 Subsequent PMBus commands will affect that rail.=
=C2=A0
      If phosphor-regulators and a driver are both communicating with
      the regulator, they may both be setting PAGE and thus their
      subsequent commands are going to the wrong rail.</p>
    <blockquote type=3D"cite"
      cite=3D"mid:DCAD9B4C-D047-40A0-B4AD-1D21C0CF6197@gmail.com">
      <div class=3D""><br class=3D"">
      </div>
      <div class=3D"">I could just not use hwmon at all use
        phosphor-regulators for all telemetry, but this seemed like more
        work.</div>
      <div class=3D""><br class=3D"">
      </div>
    </blockquote>
    <p>Sorry about that.=C2=A0 I think if you have already done the work of
      defining the regulator and a read sensors rule in your JSON file,
      adding a few more sensors is not much additional work though.=C2=A0 L=
et
      me know if you have questions.<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:DCAD9B4C-D047-40A0-B4AD-1D21C0CF6197@gmail.com">
      <div class=3D"">Also, I will need to figure out how to connect
        phosphor-regulators telemetry to Redfish and the WebUI. Are
        there examples of how to do that?</div>
    </blockquote>
    It should just work with no additional effort as long as you define
    the following correctly in your JSON file:<br>
    <p>* The "inventory_path" property of your "chassis" object needs to
      match a real chassis inventory item on D-Bus.</p>
    <p>* The "fru" property of your regulator "device" object needs to
      match a real inventory item on D-Bus.=C2=A0 As I mentioned earlier,
      normally if the regulator is pluggable then this is the regulator
      itself.=C2=A0 Otherwise it is the larger hardware item that contains
      it, such as a motherboard.=C2=A0 FRU is the acronym for Field
      Replaceable Unit, referring to a pluggable hardware item.<br>
    </p>
    <p>phosphor-regulators will publish your sensors on D-Bus with the
      standard object paths and properties.=C2=A0 The two JSON properties
      above are used to define a "chassis" association and an
      "inventory_item" association on D-Bus that is used by bmcweb.=C2=A0
      This will cause your sensors to appear in Redfish and the Web UI.</p>
    <p>Thanks,</p>
    <p>Shawn<br>
    </p>
  </body>
</html>

--------------UdeY1ZD5LrlV9WDo2XrFBSVI--

