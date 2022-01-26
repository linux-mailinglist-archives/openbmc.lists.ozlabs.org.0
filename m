Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D554E49D77A
	for <lists+openbmc@lfdr.de>; Thu, 27 Jan 2022 02:29:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkjgd5BDJz30NB
	for <lists+openbmc@lfdr.de>; Thu, 27 Jan 2022 12:29:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NGorPvl7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=shawnmm@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NGorPvl7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JkdzS6M9vz2xfy
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jan 2022 09:43:16 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20QMTgRt030879
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jan 2022 22:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : subject : to : references : cc : from : in-reply-to :
 mime-version; s=pp1; bh=YNI/uLbM+UVT45UY8fu010NPEiEbnxWBFd6lNsYWRMo=;
 b=NGorPvl7+WViBkdjtUl5NTVyIvhGimc7J47sxC7Dq2YdOL9A8qruE4kIbpEw/hNGu90V
 WXG4O0LVc7iJJ13j5LXthW3alL62IB0uJgfd3Xx3uF2gNXWwuLglmUF1pbVHbKKcJfS6
 hzcRD0WJ+0IoFZB9sNyMgT1U1+qIfXoFeIzIuciYtqAFAtts1AQgCmT7rv4y9tIa8Xdv
 lKHodzAFJkCEySRboinu3wGw50hZm3Cr7A5fcw+sEVz+LW69VyGNzYrKD4AI183ptHZz
 72xvZsu/uxOhZMHjcsoZch9BBpxd6VV9T6sBNcFIawl/9L/VHsctjty/hpLobAidSRFX ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dubcjdsn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jan 2022 22:43:13 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20QMcU74002128
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jan 2022 22:43:12 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dubcjdsmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 22:43:12 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20QMW8PD022172;
 Wed, 26 Jan 2022 22:43:11 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3dr9jc1ptv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 22:43:11 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20QMhAbU30015916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jan 2022 22:43:10 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9CC9AAE063;
 Wed, 26 Jan 2022 22:43:10 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EBE8AE05F;
 Wed, 26 Jan 2022 22:43:10 +0000 (GMT)
Received: from [9.211.46.150] (unknown [9.211.46.150])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 26 Jan 2022 22:43:10 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------23mZeO0wanjDaZQUjmlpi7hI"
Message-ID: <c0fc4612-35c2-be2a-1425-020b7cde3565@linux.ibm.com>
Date: Wed, 26 Jan 2022 16:43:09 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: No dbus objects for phosphor-regulators
Content-Language: en-US
To: Mike Jones <proclivis@gmail.com>
References: <8C9640C9-6E1B-4495-BA55-258DA1548799@gmail.com>
From: Shawn McCarney <shawnmm@linux.ibm.com>
In-Reply-To: <8C9640C9-6E1B-4495-BA55-258DA1548799@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jNasBEwZVNQTgcfopsRwN26b-njWWRwV
X-Proofpoint-ORIG-GUID: XjuIls-0OtrpMKZlc0hLrUycat5INRuT
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_09,2022-01-26_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260130
X-Mailman-Approved-At: Thu, 27 Jan 2022 12:29:28 +1100
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------23mZeO0wanjDaZQUjmlpi7hI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mike,

> I made a config file below, and verified that it is on the target and 
> loads without error.

Just to make sure I understand what you are saying, on the BMC your 
'config.json' file is installed in the /usr/share/phosphor-regulators 
directory?

And when you run 'journalctl -u phosphor-regulators.service', you see a 
journal message stating that the phosphor-regulators application has 
loaded your JSON file successfully?  And no error messages?

> When the target boots, using a I2C spy tool, the 0xDD command is being 
> read periodically, suggesting that this service is processing the read 
> command, and a query show the service is up.
>
Sensor reading should begin when the chassis is powered on and stop when 
the chassis is powered off.  That is because some regulators don't have 
power at standby or report invalid sensor readings.

Does the 'journalctl | grep -i Regulators' show that the service files 
are being executed that enable and disable regulator sensor monitoring?

> Using dbus-monitor –system, I do not see any transactions that place 
> these sensor read values on dbus, nor does the normal probing the 
> chassis and inventory show values.
>
Since you are reading a vout sensor for the rail named "vdd", the 
resulting D-Bus object path for the sensor should be

   /xyz/openbmc_project/sensors/voltage/vdd_vout

See 
https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulators/docs/config_file/pmbus_read_sensor.md#d-bus-sensor 
for more details.

Does that object path exist on D-Bus after you've powered on the chassis 
and sensor monitoring has been enabled?

You can see all the properties of the D-Bus sensor using the command

   busctl introspect xyz.openbmc_project.Power.Regulators 
/xyz/openbmc_project/sensors/voltage/vdd_vout

You can see all regulator sensor object paths via the command:

   busctl tree xyz.openbmc_project.Power.Regulators

The phosphor-regulators application reads sensors once per second.  
However, it only updates D-Bus if the new sensor value has changed more 
than a hysteresis amount.  This is to avoid generating a bunch of D-Bus 
traffic for minor value changes.

You can see the hysteresis values here: 
https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulators/src/dbus_sensor.cpp#L66

> What else do I need to so that there are dbus objects?

For bmcweb and Redfish to work, you need associations between the D-Bus 
sensor and two D-Bus inventory objects:

* The FRU that contains the regulator.  This is the replaceable hardware 
item where the regulator is located.  Some regulators are FRUs by 
themselves (replaceable).  Some are located on larger FRUs like a 
motherboard.  This is used to get presence, health info, and if 
applicable VPD.

* The chassis that contains the regulator.  This is required by Redfish 
since it groups sensors by chassis.

The phosphor-regulators application creates those associations 
automatically based on information in your JSON file.  The "fru" 
property of the regulator "device" provides the first inventory object 
path.  The "inventory_path" property of the "chassis" provides the 
second inventory path.  Both of those are relative to the 
"/xyz/openbmc_project/inventory" root path.

Do the "fru" and "inventory_path" properties in your JSON file match the 
correct inventory object paths on your system?

> Note I have not done anything to intentionally use open_power. My goal 
> is to only use phosphor-regulators to expose some telemetry that hwmon 
> does not support.
>
That's fine.  This application does not have any dependencies on open_power.

Let me know if you need more info.

Shawn

--------------23mZeO0wanjDaZQUjmlpi7hI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Mike,</p>
    <o:p></o:p>
    <blockquote type="cite"
      cite="mid:8C9640C9-6E1B-4495-BA55-258DA1548799@gmail.com">I made a
      config file below, and verified that it is on the target and loads
      without error.<o:p></o:p></blockquote>
    <p>Just to make sure I understand what you are saying, on the BMC
      your 'config.json' file is installed in the
      /usr/share/phosphor-regulators directory?<br>
    </p>
    <p>And when you run 'journalctl -u phosphor-regulators.service', you
      see a journal message stating that the phosphor-regulators
      application has loaded your JSON file successfully?  And no error
      messages?<br>
    </p>
    <blockquote type="cite"
      cite="mid:8C9640C9-6E1B-4495-BA55-258DA1548799@gmail.com">
      <p class="MsoNormal" style="-webkit-text-size-adjust: auto;
        margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">When
        the target boots, using a I2C spy tool, the 0xDD command is
        being read periodically, suggesting that this service is
        processing the read command, and a query show the service is up.</p>
    </blockquote>
    <p>Sensor reading should begin when the chassis is powered on and
      stop when the chassis is powered off.  That is because some
      regulators don't have power at standby or report invalid sensor
      readings.</p>
    <p>Does the 'journalctl | grep -i Regulators' show that the service
      files are being executed that enable and disable regulator sensor
      monitoring?<br>
    </p>
    <blockquote type="cite"
      cite="mid:8C9640C9-6E1B-4495-BA55-258DA1548799@gmail.com">
      <p class="MsoNormal" style="-webkit-text-size-adjust: auto;
        margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">Using
        dbus-monitor –system, I do not see any transactions that place
        these sensor read values on dbus, nor does the normal probing
        the chassis and inventory show values.</p>
    </blockquote>
    <p>Since you are reading a vout sensor for the rail named "vdd", the
      resulting D-Bus object path for the sensor should be<br>
    </p>
    <p>  /xyz/openbmc_project/sensors/voltage/vdd_vout</p>
    <p>See
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulators/docs/config_file/pmbus_read_sensor.md#d-bus-sensor">https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulators/docs/config_file/pmbus_read_sensor.md#d-bus-sensor</a>
      for more details.<br>
    </p>
    <p>Does that object path exist on D-Bus after you've powered on the
      chassis and sensor monitoring has been enabled?<br>
    </p>
    <p>You can see all the properties of the D-Bus sensor using the
      command</p>
    <p>  busctl introspect xyz.openbmc_project.Power.Regulators
      /xyz/openbmc_project/sensors/voltage/vdd_vout</p>
    <p>You can see all regulator sensor object paths via the command:</p>
    <p>  busctl tree xyz.openbmc_project.Power.Regulators<br>
    </p>
    <p>The phosphor-regulators application reads sensors once per
      second.  However, it only updates D-Bus if the new sensor value
      has changed more than a hysteresis amount.  This is to avoid
      generating a bunch of D-Bus traffic for minor value changes.</p>
    <p>You can see the hysteresis values here:
<a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulators/src/dbus_sensor.cpp#L66">https://github.com/openbmc/phosphor-power/blob/master/phosphor-regulators/src/dbus_sensor.cpp#L66</a><br>
    </p>
    <blockquote type="cite"
      cite="mid:8C9640C9-6E1B-4495-BA55-258DA1548799@gmail.com">
      <p class="MsoNormal" style="-webkit-text-size-adjust: auto;
        margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;"><o:p></o:p></p>
      What else do I need to so that there are dbus objects?<o:p></o:p></blockquote>
    <p>For bmcweb and Redfish to work, you need associations between the
      D-Bus sensor and two D-Bus inventory objects:<br>
    </p>
    <p>* The FRU that contains the regulator.  This is the replaceable
      hardware item where the regulator is located.  Some regulators are
      FRUs by themselves (replaceable).  Some are located on larger FRUs
      like a motherboard.  This is used to get presence, health info,
      and if applicable VPD.<br>
    </p>
    <p>* The chassis that contains the regulator.  This is required by
      Redfish since it groups sensors by chassis.<br>
    </p>
    <p>The phosphor-regulators application creates those associations
      automatically based on information in your JSON file.  The "fru"
      property of the regulator "device" provides the first inventory
      object path.  The "inventory_path" property of the "chassis"
      provides the second inventory path.  Both of those are relative to
      the "/xyz/openbmc_project/inventory" root path.</p>
    <p>Do the "fru" and "inventory_path" properties in your JSON file
      match the correct inventory object paths on your system?<o:p></o:p><br>
      <o:p></o:p></p>
    <blockquote type="cite"
      cite="mid:8C9640C9-6E1B-4495-BA55-258DA1548799@gmail.com">
      <p class="MsoNormal" style="-webkit-text-size-adjust: auto;
        margin: 0in; font-size: 11pt; font-family: Calibri, sans-serif;">Note
        I have not done anything to intentionally use open_power. My
        goal is to only use phosphor-regulators to expose some telemetry
        that hwmon does not support.</p>
    </blockquote>
    <p>That's fine.  This application does not have any dependencies on
      open_power.</p>
    <p>Let me know if you need more info.</p>
    <p>Shawn<br>
    </p>
  </body>
</html>
--------------23mZeO0wanjDaZQUjmlpi7hI--

