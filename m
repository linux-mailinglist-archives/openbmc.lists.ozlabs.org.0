Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A524A62A7
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 18:39:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpBxZ3kp4z3bWj
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 04:38:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JXgK9a7Y;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=shawnmm@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JXgK9a7Y; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpBx51jcyz30QZ
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 04:38:32 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211HXGf2002508
 for <openbmc@lists.ozlabs.org>; Tue, 1 Feb 2022 17:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=pp1; bh=DEB6Ero1lkD6N5WbzMyF2LSufZjxsu1w4ncGHQ+exmI=;
 b=JXgK9a7Yw5/DhNOg8/wafuevVRSYduSiii/YMCBxQV8k1HDYxQ/Cj+bi4FQRG3FW71jv
 68ydmj7w5xEkJV7Y4azVDY/F2RHYP1Wql5SsJZhfuifkvkeeV+7eawKDR1xiDZAqTeaT
 iEFBRnKWIlhhtigz4ox6Md2hdMAPDYLqTLxDNAeTYUvUC9813So1zHLGhVseOZfoQFUm
 RW9ls+4YFNCHvztEFMLQnE/LobCX9S9pmRBhTwNHt4aBnantFk67wYI28Y8omjIHFeqP
 J8FfBKgRm6Zk0P0f2tFV3F/NoCPb+dexODXlLK8NlDtCHnS6UbV/N9iHStWOyq4VRFfp qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dy9bx0375-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 01 Feb 2022 17:38:28 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 211HYep2006603
 for <openbmc@lists.ozlabs.org>; Tue, 1 Feb 2022 17:38:28 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dy9bx0370-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 17:38:28 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 211HZ1Fi029219;
 Tue, 1 Feb 2022 17:38:28 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 3dvw7anpgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 17:38:27 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 211HcQUX9109986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Feb 2022 17:38:27 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB750C6059;
 Tue,  1 Feb 2022 17:38:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C103C6055;
 Tue,  1 Feb 2022 17:38:26 +0000 (GMT)
Received: from [9.211.46.150] (unknown [9.211.46.150])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Feb 2022 17:38:26 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------4Z1lakRW9xpDWXrQG2KRxiJW"
Message-ID: <9aaceaed-1a8a-6a13-d650-8f4678d267d4@linux.ibm.com>
Date: Tue, 1 Feb 2022 11:37:26 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: No dbus objects for phosphor-regulators
Content-Language: en-US
To: Mike <proclivis@gmail.com>
References: <FC1C96F9-CA9C-45B8-9FF5-26CF04109852@gmail.com>
From: Shawn McCarney <shawnmm@linux.ibm.com>
In-Reply-To: <FC1C96F9-CA9C-45B8-9FF5-26CF04109852@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: T9qVcdkKQh60EnOmA_nRKdxuNJLQw4cE
X-Proofpoint-ORIG-GUID: y0BNTIkHn_hKrsipk6zYfQ0zYXVAOxb4
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_09,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202010098
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
--------------4Z1lakRW9xpDWXrQG2KRxiJW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>>> When the target boots, using a I2C spy tool, the 0xDD command is 
>>> being read periodically, suggesting that this service is processing 
>>> the read command, and a query show the service is up.
>>>
>> Sensor reading should begin when the chassis is powered on and stop 
>> when the chassis is powered off.  That is because some regulators 
>> don't have power at standby or report invalid sensor readings.
>>
>
> I am using the SDK, so I have not worked on chassis power, so I don’t 
> know if it is powered or not, but this gives me a good hint about the 
> problem. Even so, the read command in config.json is getting polled. 
> The other config item to modify the voltage did not occur.

It sounds like at least part of the problem might be the systemd service 
files not running.  The regulators service files are located in 
https://github.com/openbmc/phosphor-power/tree/master/services.

* phosphor-regulators.service:  This one launches the regulators app.  
This must be happening since you are a getting journal message about it 
loading the JSON config file.

* phosphor-regulators-config.service:  This is what causes the 
configuration entries to be executed in the JSON file.  This should 
happen early in the process of powering on the chassis before the 
regulators have received power (been enabled).

* phosphor-regulators-monitor-enable.service:  This enables sensor and 
phase fault monitoring.  This should happen during the chassis power on 
after the regulators have received power (been enabled).

* phosphor-regulators-monitor-disable.service:  This disables sensor and 
phase fault monitoring.  This should happen early when the chassis is 
being powered off.

Sounds like maybe the last 3 service files are being run?  You can tell 
for sure by looking in the journal (e.g. 'journalctl | grep -i 
regulator').  The Wants/Before/After dependencies in the files determine 
when they are run.  Perhaps the systemd targets they are dependent on 
aren't running on your system?

You can manually cause the regulators application to perform 
configuration and sensor monitoring using the 'regsctl' program. Look at 
the service files to see the proper regsctl command to use.  This is an 
implementation detail and could change in the future, but it may help 
with debugging right now.

Regarding the fact the 0xDD is being read, is it possibly being read by 
another application like hwmon?

Note that the phosphor-regulators application does direct I2C reads and 
writes using the i2c-dev subsystem.  This is the same code path as 
i2cget/i2cset.  This means it should not be used in conjunction with a 
device driver on the regulator.  Otherwise there may be interleaved I2C 
commands going to the device, which can be problematic.

>
> Given I am using an Aspeed EVK, is there an example for how to turn on 
> a chassis with a GPIO, or a dbus operation, or an automatic turn on at 
> boot?
>
Sorry, I'm not very familiar with that.  Others on this list could help 
more with that as a separate question thread.  I use the 'obmcutil 
chassison' command.  Since that is a script, you could check out what it 
is doing and see if that would help.

>
>> The phosphor-regulators application creates those associations 
>> automatically based on information in your JSON file.  The "fru" 
>> property of the regulator "device" provides the first inventory 
>> object path.  The "inventory_path" property of the "chassis" provides 
>> the second inventory path.  Both of those are relative to the 
>> "/xyz/openbmc_project/inventory" root path.
>>
>> Do the "fru" and "inventory_path" properties in your JSON file match 
>> the correct inventory object paths on your system?
>>
> I have a psu.json with fruConfigs, and this has
>
> “PsuDevices”: {
> “/xyz/openbmc-project/inventory/system/chassis/motherboard/powersupply0” 
> : “/sys/bus/i2c/devices/11-004f”,
> }
>
> Which is the same i2c address as used by phosphor-regulators.
>
> And a power-supply-monitor-0.conf to match.
>
It sounds like you are using a power supply application from the same 
repository.  That is no problem, but they are completely separate 
applications that do no share any data/functionality.  So I don't think 
the work you've done with the PSU app would impact the regulators app.

It may be a typo above, but a voltage regulator would not normally be at 
the same I2C address as a power supply.  The term 'power supply' in that 
repo means the device that converts AC/DC wall power to 12V DC to the 
system (e.g. the big brick).  The term 'voltage regulator' means the 
devices that step 12V DC from the power supply down to the levels needed 
by system components (like 3.3V, 1.1V, etc.).

--------------4Z1lakRW9xpDWXrQG2KRxiJW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <blockquote type="cite"
      cite="mid:FC1C96F9-CA9C-45B8-9FF5-26CF04109852@gmail.com">
      <div dir="ltr">
        <blockquote type="cite">
          <div dir="ltr">
            <p> </p>
            <blockquote type="cite"
              cite="mid:8C9640C9-6E1B-4495-BA55-258DA1548799@gmail.com">
              <p class="MsoNormal" style="-webkit-text-size-adjust:
                auto; margin: 0in; font-size: 11pt; font-family:
                Calibri, sans-serif;">When the target boots, using a I2C
                spy tool, the 0xDD command is being read periodically,
                suggesting that this service is processing the read
                command, and a query show the service is up.</p>
            </blockquote>
            <p>Sensor reading should begin when the chassis is powered
              on and stop when the chassis is powered off.  That is
              because some regulators don't have power at standby or
              report invalid sensor readings.</p>
          </div>
        </blockquote>
        <div><br>
        </div>
        <div>I am using the SDK, so I have not worked on chassis power,
          so I don’t know if it is powered or not, but this gives me a
          good hint about the problem. Even so, the read command in
          config.json is getting polled. The other config item to modify
          the voltage did not occur.</div>
      </div>
    </blockquote>
    <p>It sounds like at least part of the problem might be the systemd
      service files not running.  The regulators service files are
      located in
      <a class="moz-txt-link-freetext" href="https://github.com/openbmc/phosphor-power/tree/master/services">https://github.com/openbmc/phosphor-power/tree/master/services</a>.</p>
    <p>* phosphor-regulators.service:  This one launches the regulators
      app.  This must be happening since you are a getting journal
      message about it loading the JSON config file.</p>
    <p>* phosphor-regulators-config.service:  This is what causes the
      configuration entries to be executed in the JSON file.  This
      should happen early in the process of powering on the chassis
      before the regulators have received power (been enabled).<br>
    </p>
    <p>* phosphor-regulators-monitor-enable.service:  This enables
      sensor and phase fault monitoring.  This should happen during the
      chassis power on after the regulators have received power (been
      enabled).</p>
    <p>* phosphor-regulators-monitor-disable.service:  This disables
      sensor and phase fault monitoring.  This should happen early when
      the chassis is being powered off.</p>
    <p>Sounds like maybe the last 3 service files are being run?  You
      can tell for sure by looking in the journal (e.g. 'journalctl |
      grep -i regulator').  The Wants/Before/After dependencies in the
      files determine when they are run.  Perhaps the systemd targets
      they are dependent on aren't running on your system?</p>
    <p>You can manually cause the regulators application to perform
      configuration and sensor monitoring using the 'regsctl' program. 
      Look at the service files to see the proper regsctl command to
      use.  This is an implementation detail and could change in the
      future, but it may help with debugging right now.</p>
    <p>Regarding the fact the 0xDD is being read, is it possibly being
      read by another application like hwmon?</p>
    <p>Note that the phosphor-regulators application does direct I2C
      reads and writes using the i2c-dev subsystem.  This is the same
      code path as i2cget/i2cset.  This means it should not be used in
      conjunction with a device driver on the regulator.  Otherwise
      there may be interleaved I2C commands going to the device, which
      can be problematic.<br>
    </p>
    <blockquote type="cite"
      cite="mid:FC1C96F9-CA9C-45B8-9FF5-26CF04109852@gmail.com">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        Given I am using an Aspeed EVK, is there an example for how to
        turn on a chassis with a GPIO, or a dbus operation, or an
        automatic turn on at boot?<br>
        <br>
      </div>
    </blockquote>
    <p>Sorry, I'm not very familiar with that.  Others on this list
      could help more with that as a separate question thread.  I use
      the 'obmcutil chassison' command.  Since that is a script, you
      could check out what it is doing and see if that would help.<br>
    </p>
    <blockquote type="cite"
      cite="mid:FC1C96F9-CA9C-45B8-9FF5-26CF04109852@gmail.com">
      <div dir="ltr"><br>
        <blockquote type="cite">
          <div dir="ltr">
            <p> </p>
            <p>The phosphor-regulators application creates those
              associations automatically based on information in your
              JSON file.  The "fru" property of the regulator "device"
              provides the first inventory object path.  The
              "inventory_path" property of the "chassis" provides the
              second inventory path.  Both of those are relative to the
              "/xyz/openbmc_project/inventory" root path.</p>
            <p>Do the "fru" and "inventory_path" properties in your JSON
              file match the correct inventory object paths on your
              system?<o:p></o:p><br>
            </p>
          </div>
        </blockquote>
        <div dir="ltr">I have a psu.json with fruConfigs, and this has</div>
        <div dir="ltr"><br>
        </div>
        <div dir="ltr">“PsuDevices”: {</div>
        <div dir="ltr"> 
          “/xyz/openbmc-project/inventory/system/chassis/motherboard/powersupply0”
          : “/sys/bus/i2c/devices/11-004f”,</div>
        <div dir="ltr">}</div>
        <div dir="ltr"><br>
        </div>
        <div dir="ltr">Which is the same i2c address as used by
          phosphor-regulators.</div>
        <div dir="ltr"><br>
        </div>
        <div dir="ltr">And a power-supply-monitor-0.conf to match.<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p>It sounds like you are using a power supply application from the
      same repository.  That is no problem, but they are completely
      separate applications that do no share any data/functionality.  So
      I don't think the work you've done with the PSU app would impact
      the regulators app.</p>
    <p>It may be a typo above, but a voltage regulator would not
      normally be at the same I2C address as a power supply.  The term
      'power supply' in that repo means the device that converts AC/DC
      wall power to 12V DC to the system (e.g. the big brick).  The term
      'voltage regulator' means the devices that step 12V DC from the
      power supply down to the levels needed by system components (like
      3.3V, 1.1V, etc.).</p>
  </body>
</html>

--------------4Z1lakRW9xpDWXrQG2KRxiJW--

