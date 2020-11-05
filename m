Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E822A8863
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 21:53:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRwj61gzQzDr8C
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 07:53:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mspinler@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pv+xtVH+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRwhC2LMfzDqwr
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 07:52:42 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5KqbnM129783; Thu, 5 Nov 2020 15:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ca6oH09PqlP9KfqfjANxD/ZOd+JpjDihwd4mmCo1sbA=;
 b=pv+xtVH+fNe5eqGgeRN1oiJeH6SzuzAPHSbBocnbfskgz0bm1SRNJ6cxuR5+tSA2T9gF
 dDlDEhLiWNCLfVDG/sQhW5jZXkJtxiROnUSCpBBaKC4APCWuixkQEyQaQwvFlOG6JH8D
 JvgTrcRrnjPq1ys5APYzlDh6Vwmle8mKvl2dmUZe/hVxbtCbz6zaXTkgLDV8mE/tIQ/Y
 iC1st7cDOI3Q1Oo3Au2jTqC40W7IEo+xQmvf3xU6EDC49zuKlPslfLxlgwkD6enXRevp
 sLtPOX+RiorEhnjlWgJd7kWptXH2HSy3V7QOkhmCLDn2oc+hz91GFc/iOzQCZgZBhlwj bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34m8ww8ph5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 15:52:38 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0A5KqcgP130302;
 Thu, 5 Nov 2020 15:52:38 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34m8ww8pdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 15:52:37 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A5KhmF2017453;
 Thu, 5 Nov 2020 20:52:28 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 34h0s7xrtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 20:52:28 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A5KqRK864881054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Nov 2020 20:52:27 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42CF578CBA;
 Thu,  5 Nov 2020 20:52:27 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9196E78CBB;
 Thu,  5 Nov 2020 20:52:26 +0000 (GMT)
Received: from [9.65.240.102] (unknown [9.65.240.102])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Nov 2020 20:52:26 +0000 (GMT)
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Thu Ba Nguyen <tbnguyen1985@gmail.com>
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
 <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
 <90950FB3-E1B3-4ACE-97C5-CB9582A94456@fb.com>
 <CALioo37b-BjgUdfZz2Vm+=6K6VMYRO9auyuHHo7=AZBFpoBzdw@mail.gmail.com>
 <CALioo37LBToJaMs9Zt4q4WcMYKT_rF9zG1ujxv3q8HOQvsE8-w@mail.gmail.com>
 <26b02688-a8c8-3fb3-6cc9-50daabf4d01e@linux.ibm.com>
 <CALioo34WDkK6nVY0+rjKKObcpYVW5JmAZ7sitmXNHP-MM7zhAQ@mail.gmail.com>
 <CALioo35QFf6n64pAJm8iiUNzas6-jtf9Xu8hDHmhLQGLSwXpDg@mail.gmail.com>
 <14c0a498-498c-8447-685b-c97d04c699ab@linux.ibm.com>
 <CALioo347c8tYxeGqfhZyUAN-WCsph8a6Uqea-srvNh5OXVotKQ@mail.gmail.com>
From: Matt Spinler <mspinler@linux.ibm.com>
Message-ID: <2bcada80-0135-4a45-01cd-33a3cf43dfc2@linux.ibm.com>
Date: Thu, 5 Nov 2020 14:52:30 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CALioo347c8tYxeGqfhZyUAN-WCsph8a6Uqea-srvNh5OXVotKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_14:2020-11-05,
 2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011050132
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 11/4/2020 4:18 PM, Thu Ba Nguyen wrote:
> Please see my comments below. Thanks. Thu Nguyen. On Wed, Nov 4, 2020 
> at 11:31 PM...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> Please see my comments below.
>
> Thanks.
> Thu Nguyen.
>
> On Wed, Nov 4, 2020 at 11:31 PM Matt Spinler <mspinler@linux.ibm.com 
> <mailto:mspinler@linux.ibm.com>> wrote:
>
>
>
>     On 11/4/2020 3:15 AM, Thu Ba Nguyen wrote:
>     > Hi Matt, I implemented "Inactive the host sensors" in
>     phosphor-hwmon
>     > use below...
>     > This Message Is From an External Sender
>     > This message came from outside your organization.
>     >
>     > Hi Matt,
>     >
>     > I implemented "Inactive the host sensors" in phosphor-hwmon use
>     below
>     > approaching:
>     > 1. Add one option in Sensors configuration, phosphor-hwmon will
>     parse
>     > this option and add host sensors to _hostSensors list.
>     > 2. In mainloop::read() before going to loop to read the sensors
>     in the
>     > reading list. Query dbus to get CurrentHostState property.
>     > This property belongs to service "xyz.openbmc_project.State.Host".
>     > Based on the status of this property, identify host status.
>     > If the host is off, remove the host sensors from _state list and
>     dbus.
>     > I expected the users wouldn't see the host sensors on the BMC
>     Web when
>     > the host is off.
>     > If the host is on, add the host sensors back to _state list and
>     also dbus.
>     >
>     > The code is working. But I have two issues with this approaching:
>     >
>     > 1. Too many transactions to get dbus property CurrentHostState.
>     > In my case, I have 6 services to monitor the sensors which
>     concern the
>     > host.
>     > With the current interval 1 second of phosphor-hwmon, I have 6
>     > transactions to get CurrentHostState per seconds.
>
>     The better way to implement this would be to read CurrentHostState
>     once
>     on startup, and then register for
>     propertiesChanged signals for it and provide a callback to update an
>     internal host state variable.
>
> [Thu] Yes, This is what I'm planning to do. But don't know how to add 
> a propertiesChanged signals
> to the current phosphor-hwmon framework.
>
> I usually use below code to add a signal to dbus.
>     boost::asio::io_service io;
>     ampere::host::conn =
> std::make_shared<sdbusplus::asio::connection>(ampere::host::io);
>
> std::vector<std::unique_ptr<sdbusplus::bus::match::match>> matches;
>     //Start tracking power state
> std::unique_ptr<sdbusplus::bus::match::match> hostMonitor =
>         ampere::host::startHostStateMonitor();
>     matches.emplace_back(std::move(hostMonitor));
>
>     /* wait for the signal */
>     ampere::host::io.run();
> But when start io.run(), phosphor-hwmon will stop reading sensors.

There is already an sdbusplus loop running, it's in Mainloop::run().

>
>     > 2. When I call "ipmitool power off" the host, there is a gap
>     between
>     > the time I trigger GPIO to power off the chassis and the time Dbus
>     > property CurrentHostState is updated.
>     > In this gap, the phosphor-hwmon is still reading sensors. And this
>     > causes the threshold warnings or errors. I want to avoid this.
>     >
>     > Do you have any suggestions to avoid these issues?
>     >
>
>     I can't think of anything at the moment.  Maybe someone else has
>     an idea
>     here.
>
>     > Others question:
>     > I saw that phosphor-hwmon is registering an event to smbus and
>     trigger
>     > the event after each 1 second to read sensors.
>     > Can I change the phosphor-hwmon code to integrate one dbus
>     signal event?
>     > Which will be triggered when there is changing in dbus property.
>
>     I'm not sure I understand what you're asking for here. Right now it
>     will do 1 second reads (the period is
>     configurable) and send a properties changed signal for each sensor on
>     D-Bus only when the value changes.
>
> [Thu] I'm asking for how to add a signal to current phosphor-hwmon 
> framework as comment 1.
>
>     >
>     > I knew how to create a service which adds the call back function
>     when
>     > there is change in dbus property.
>     > But don't know how to intergrace it to hwmon.
>     >
>     > Regards.
>     > Thu Nguyen.
>     >
>     >
>     >
>     > On Fri, Oct 23, 2020 at 5:45 AM Thu Ba Nguyen
>     <tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>
>     > <mailto:tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>>>
>     wrote:
>     >
>     >     Just remove all of added code, rebase the phosphor-hwmon
>     source to
>     >     commit
>     >     "5906173 (12 months ago) Brad Bishop: build: add support for
>     >     building with meson"
>     >
>     >     Add the include:
>     >     #include<sdbusplus/asio/connection.hpp>
>     >     I can see the error
>     >     |
>     >
>      /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:
>     >     phosphor_hwmon_readd-readd.o: undefined reference to symbol
>     >     'pthread_key_delete@@GLIBC_2.4'
>     >     |
>     >
>      /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:
>     >
>      /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0:
>     >     error adding symbols: DSO missing from command line
>     >     | collect2: error: ld returned 1 exit status
>     >     | make[2]: *** [Makefile:643: phosphor-hwmon-readd] Error 1
>     >     | make[2]: Leaving directory
>     >
>      '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build'
>     >     | make[1]: *** [Makefile:801: all-recursive] Error 1
>     >     | make[1]: Leaving directory
>     >
>      '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build'
>     >     | make: *** [Makefile:524: all] Error 2
>     >     | ERROR: oe_runmake failed
>     >     | WARNING: exit code 1 from a shell command.
>     >     | ERROR: Execution of
>     >
>      '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/temp/run.do_compile.2045'
>     >     failed with exit code 1:
>     >     | Makefile:800: target 'check-valgrind-recursive' given more
>     than
>     >     once in the same rule
>     >     | Makefile:800: target 'check-valgrind-memcheck-recursive' given
>     >     more than once in the same rule
>     >     | Makefile:800: target 'check-valgrind-helgrind-recursive' given
>     >     more than once in the same rule
>     >     | Makefile:800: target 'check-valgrind-drd-recursive' given more
>     >     than once in the same rule
>     >     | Makefile:800: target 'check-valgrind-sgcheck-recursive' given
>     >     more than once in the same rule
>     >     | make  all-recursive
>     >
>     >     I think we should add thread lib.
>     >
>     >     Regards.
>     >     Thu Nguyen.
>     >
>     >     On Thu, Oct 22, 2020 at 10:51 PM Matt Spinler
>     >     <mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>
>     <mailto:mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>>>
>     wrote:
>     >
>     >
>     >
>     >         On 10/22/2020 9:49 AM, Thu Ba Nguyen wrote:
>     >         > I started on supporting enable/disable host sensors.
>     >         Everythings is
>     >         > fine until I...
>     >         > This Message Is From an External Sender
>     >         > This message came from outside your organization.
>     >         >
>     >         > I started on supporting enable/disable host sensors.
>     >         > Everythings is fine until I add code to monitor host
>     status
>     >         as below.
>     >         > bool MainLoop::isHostOn(void)
>     >         > {
>     >         > char buff[128];
>     >         > if (!powerMatch)
>     >         > {
>     >         > log<level::ERR>("Power Match Not Created");
>     >         > }
>     >         > sprintf(buff, "isHostOn powerStatusOn:
>     %d\n",powerStatusOn);
>     >         > log<level::INFO>(buff);
>     >         > return powerStatusOn;
>     >         > }
>     >         > std::shared_ptr<sdbusplus::bus::match::match>
>     >         > MainLoop::startHostStateMonitor(void) {
>     >         > return std::make_shared<sdbusplus::bus::match::match>(
>     >         > *conn,
>     >         >
>     "type='signal',interface='org.freedesktop.DBus.Properties',"
>     >         >
>     >  "member='PropertiesChanged',arg0='xyz.openbmc_project.State.Host'",
>     >         > [](sdbusplus::message::message &msg) {
>     >         > std::string interfaceName;
>     >         > boost::container::flat_map<std::string,
>     >         std::variant<std::string>>
>     >         > propertiesChanged;
>     >         > try {
>     >         > msg.read(interfaceName, propertiesChanged);
>     >         > } catch (std::exception &e) {
>     >         > log<level::ERR>("Unable to read host state\n");
>     >         > return;
>     >         > }
>     >         > // We only want to check for CurrentHostState
>     >         > if (propertiesChanged.begin()->first !=
>     "CurrentHostState") {
>     >         > return;
>     >         > }
>     >         > auto findState = propertiesChanged.find(powProperty);
>     >         > if (findState != propertiesChanged.end())
>     >         > {
>     >         > powerStatusOn = boost::ends_with(
>     >         > std::get<std::string>(findState->second), "Running");
>     >         > }
>     >         > powerMatch = true;
>     >         > });
>     >         > }
>     >         > void MainLoop::read()
>     >         > {
>     >         > // TODO: Issue#3 - Need to make calls to the dbus sensor
>     >         cache here to
>     >         > // ensure the objects all exist?
>     >         > /* Host changed state from On to Off */
>     >         > if (!isHostOn() && (lastPowerState == HOST_ON ||
>     >         > lastPowerState == HOST_NA)) {
>     >         > removeHostSensors();
>     >         > lastPowerState = HOST_OFF;
>     >         > }
>     >         > /* Host changed state from Off to On */
>     >         > if (isHostOn() && lastPowerState == HOST_OFF) {
>     >         > addDroppedHostSensors();
>     >         > lastPowerState = HOST_ON;
>     >         > }
>     >         > When build openBMC I got error:
>     >         >
>     >
>      tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0:
>     >
>     >         > error adding symbols: DSO missing from command line
>     >         > | collect2: error: ld returned 1 exit status
>     >         > | make[2]: *** [Makefile:643: phosphor-hwmon-readd]
>     Error 1
>     >         >
>     >         > It seems I need adding the threads lib to defend lib.
>     >         > Any suggestion to add threads lib to build configuration?
>     >         >
>     >
>     >         That must be because you're using that single boost
>     function?
>     >         While you
>     >         could add the dependency,
>     >         the ideal thing to do since this repo already uses
>     >         phosphor-dbus-interfaces is to use the function:
>     >
>     >                  /** @brief Convert a string to an appropriate
>     enum value.
>     >                   *  @param[in] s - The string to convert in the
>     form of
>     >                   * "xyz.openbmc_project.State.Host.<value name>"
>     >                   *  @return - The enum value.
>     >                   */
>     >                  static HostState convertHostStateFromString(const
>     >         std::string& s);
>     >
>     >         to convert it to the actual HostState enum to check against:
>     >
>     >                  enum class HostState
>     >                  {
>     >                      Off,
>     >                      Running,
>     >                      Quiesced,
>     >                      DiagnosticMode,
>     >                  };
>     >
>     >         This is all in xyz/openbmc_project/State/Host/server.hpp
>     >         provided by
>     >         phosphor-dbus-interfaces.
>     >
>     >         > Thanks.
>     >         > Thu.
>     >         >
>     >         > On Wed, Oct 21, 2020 at 11:54 PM Thu Ba Nguyen
>     >         <tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>
>     <mailto:tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>>
>     >         > <mailto:tbnguyen1985@gmail.com
>     <mailto:tbnguyen1985@gmail.com>
>     >         <mailto:tbnguyen1985@gmail.com
>     <mailto:tbnguyen1985@gmail.com>>>> wrote:
>     >         >
>     >         >     Hi Vijay,
>     >         >
>     >         >     I took a look on entity-manager and openbmc source.
>     >         >     Don't have many companies  using entity-manager
>     model to
>     >         support
>     >         >     sensors.
>     >         >
>     >         >     Regards
>     >         >     Thu Nguyen.
>     >         >
>     >         >
>     >         >     On Wed, Oct 21, 2020 at 7:15 AM Vijay Khemka
>     >         <vijaykhemka@fb.com <mailto:vijaykhemka@fb.com>
>     <mailto:vijaykhemka@fb.com <mailto:vijaykhemka@fb.com>>
>     >         >     <mailto:vijaykhemka@fb.com
>     <mailto:vijaykhemka@fb.com> <mailto:vijaykhemka@fb.com
>     <mailto:vijaykhemka@fb.com>>>>
>     >         wrote:
>     >         >
>     >         >         *From: *openbmc
>     >         >       
>      <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org
>     <mailto:fb.com@lists.ozlabs.org>
>     >         <mailto:fb.com@lists.ozlabs.org
>     <mailto:fb.com@lists.ozlabs.org>>
>     >         >         <mailto:fb.com@lists.ozlabs.org
>     <mailto:fb.com@lists.ozlabs.org>
>     >         <mailto:fb.com@lists.ozlabs.org
>     <mailto:fb.com@lists.ozlabs.org>>>> on behalf of Thu Ba Nguyen
>     >         >         <tbnguyen1985@gmail.com
>     <mailto:tbnguyen1985@gmail.com>
>     >         <mailto:tbnguyen1985@gmail.com
>     <mailto:tbnguyen1985@gmail.com>> <mailto:tbnguyen1985@gmail.com
>     <mailto:tbnguyen1985@gmail.com>
>     >         <mailto:tbnguyen1985@gmail.com
>     <mailto:tbnguyen1985@gmail.com>>>>
>     >         >         *Date: *Monday, October 19, 2020 at 11:23 AM
>     >         >         *To: *Ed Tanous <ed@tanous.net
>     <mailto:ed@tanous.net>
>     >         <mailto:ed@tanous.net <mailto:ed@tanous.net>>
>     <mailto:ed@tanous.net <mailto:ed@tanous.net>
>     >         <mailto:ed@tanous.net <mailto:ed@tanous.net>>>>
>     >         >         *Cc: *OpenBMC Maillist
>     <openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
>     >         <mailto:openbmc@lists.ozlabs.org
>     <mailto:openbmc@lists.ozlabs.org>>
>     >         >         <mailto:openbmc@lists.ozlabs.org
>     <mailto:openbmc@lists.ozlabs.org>
>     >         <mailto:openbmc@lists.ozlabs.org
>     <mailto:openbmc@lists.ozlabs.org>>>>
>     >         >         *Subject: *Re: Enable/Disable some sensors
>     when Host
>     >         On/Off
>     >         >
>     >         >         Hi Ed Tanous,
>     >         >
>     >         >         > Thanks for your info,
>     >         >
>     >         >         > But in your platform we are using phosphor-hwmon
>     >         to manage
>     >         >         sensors.
>     >         >
>     >         >         > We don't use entity-manager.
>     >         >
>     >         >         > As I knew we can't use both entity-manager and
>     >         >         phosphor-hwmon for one project.
>     >         >
>     >         >         You can use both but for different sensors.
>     You can
>     >         decide
>     >         >         what sensors to configure
>     >         >
>     >         >         via EM/dbus-sensors and which one for
>     phosphor-hwmon.
>     >         >
>     >         >         Regards
>     >         >
>     >         >         Thu Nguyen.
>     >         >
>     >
>

