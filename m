Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5397C2A8A8B
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 00:17:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRzvg46JgzDrBn
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 10:17:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qYmy452N; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRztW6mqlzDqyS
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 10:16:50 +1100 (AEDT)
Received: by mail-qv1-xf2a.google.com with SMTP id da2so1584180qvb.0
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 15:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vV4r0ZNPyqfNANnoH671utMt6vNdljpS6GO92mC54RI=;
 b=qYmy452NgobUNYxoIBEmXCwv7fP1dOD957Yu+dZfA05g7XaF5R1PP8uXmhaTjYAQ6v
 DtHEyRVFYq89JBUNrS7aOqxkfJXb8xBonrgcL3l7Bvs6fWjFGM67opch1KB05GJOZ+hs
 +fJLqkxRBITt5VzYJXIaVIfoQINSKQWTTThzu8DwwWPjams2f1XhOA4zJnz0zjqS4U9a
 1Ijdma4F0TfDz5XeHiCIK9Ii72grIdQqVuErcnKRZXHVaiemCdod7OJvIXym5GrwwL5G
 DXrasbQGy8SPJipoNhIVUM2+10uCXyzy7alyjV3VOI2NmHzbL8BlouI3nGZRPbjo9ajm
 Mmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vV4r0ZNPyqfNANnoH671utMt6vNdljpS6GO92mC54RI=;
 b=pujxiOHAi/b5iuSVxyAbqLhOs152OTBMTyva5/NG4ar5qu+NVOR5aY8Th0FCf4srqW
 I59SEeUPELlAdrYj3Z3nIdm3DQnUkktWgH2Twn+lox6lzwzcrPQjCF/5QYIVY5/XxXPt
 FOSK9tAwX0HNoULyR1QTCP30k5kxiHUZ6HuHgAPK1kYrtsbzYWk1/MVadLOvdV6ZNDYL
 DD5k5ET+n0qcLso1j7uDjYDVmratBBZnB3MBafLs2g3OoUKJGr/qh9N5K+ycNf8A8NfS
 wwNqW4x3TyZ+sWB1FesehWEBy6ahW+MEzGl91FnzqH4x9ZQvheo0BkptP89K/ZuVuaFT
 iLRQ==
X-Gm-Message-State: AOAM532RClbW/ctL7UH21ie5KgMtPsZcms2sz6d2RF24pegUEzGaSpOe
 X3hPitvWXVRvxySl29nDpqcm4cQKqfOOoYwIcYE=
X-Google-Smtp-Source: ABdhPJx8S84CN+468jTt9mz0BkWVGIM2/YSTzlo2InPBGPRwn2bvAdxvEHzun41IDcbEQ3fsUUgFSqaxpmIqou+EVwo=
X-Received: by 2002:a05:6214:9d2:: with SMTP id
 dp18mr4655076qvb.29.1604618207659; 
 Thu, 05 Nov 2020 15:16:47 -0800 (PST)
MIME-Version: 1.0
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
 <2bcada80-0135-4a45-01cd-33a3cf43dfc2@linux.ibm.com>
In-Reply-To: <2bcada80-0135-4a45-01cd-33a3cf43dfc2@linux.ibm.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Fri, 6 Nov 2020 06:16:36 +0700
Message-ID: <CALioo36zjLC-MErP4m6VDqgzdyS0Drk0P-M3MLOuJyYtAZN8fw@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000448bda05b3644a7f"
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

--000000000000448bda05b3644a7f
Content-Type: text/plain; charset="UTF-8"

There is already an sdbusplus loop running, it's in Mainloop::run().
[Thu] I think phosphor-hwmon is using the timer for Mainloop::run() which
triggers each 1 seconds.
Is this right?
To support signal the changing in dbus property, we need a service which
listens the dbus signal, right?
I'm still fresh in C++ and dbus code. So please correct me if I'm wrong.

Thanks.
Thu Nguyen.

On Fri, Nov 6, 2020 at 3:52 AM Matt Spinler <mspinler@linux.ibm.com> wrote:

>
>
> On 11/4/2020 4:18 PM, Thu Ba Nguyen wrote:
> > Please see my comments below. Thanks. Thu Nguyen. On Wed, Nov 4, 2020
> > at 11:31 PM...
> > This Message Is From an External Sender
> > This message came from outside your organization.
> >
> > Please see my comments below.
> >
> > Thanks.
> > Thu Nguyen.
> >
> > On Wed, Nov 4, 2020 at 11:31 PM Matt Spinler <mspinler@linux.ibm.com
> > <mailto:mspinler@linux.ibm.com>> wrote:
> >
> >
> >
> >     On 11/4/2020 3:15 AM, Thu Ba Nguyen wrote:
> >     > Hi Matt, I implemented "Inactive the host sensors" in
> >     phosphor-hwmon
> >     > use below...
> >     > This Message Is From an External Sender
> >     > This message came from outside your organization.
> >     >
> >     > Hi Matt,
> >     >
> >     > I implemented "Inactive the host sensors" in phosphor-hwmon use
> >     below
> >     > approaching:
> >     > 1. Add one option in Sensors configuration, phosphor-hwmon will
> >     parse
> >     > this option and add host sensors to _hostSensors list.
> >     > 2. In mainloop::read() before going to loop to read the sensors
> >     in the
> >     > reading list. Query dbus to get CurrentHostState property.
> >     > This property belongs to service "xyz.openbmc_project.State.Host".
> >     > Based on the status of this property, identify host status.
> >     > If the host is off, remove the host sensors from _state list and
> >     dbus.
> >     > I expected the users wouldn't see the host sensors on the BMC
> >     Web when
> >     > the host is off.
> >     > If the host is on, add the host sensors back to _state list and
> >     also dbus.
> >     >
> >     > The code is working. But I have two issues with this approaching:
> >     >
> >     > 1. Too many transactions to get dbus property CurrentHostState.
> >     > In my case, I have 6 services to monitor the sensors which
> >     concern the
> >     > host.
> >     > With the current interval 1 second of phosphor-hwmon, I have 6
> >     > transactions to get CurrentHostState per seconds.
> >
> >     The better way to implement this would be to read CurrentHostState
> >     once
> >     on startup, and then register for
> >     propertiesChanged signals for it and provide a callback to update an
> >     internal host state variable.
> >
> > [Thu] Yes, This is what I'm planning to do. But don't know how to add
> > a propertiesChanged signals
> > to the current phosphor-hwmon framework.
> >
> > I usually use below code to add a signal to dbus.
> >     boost::asio::io_service io;
> >     ampere::host::conn =
> > std::make_shared<sdbusplus::asio::connection>(ampere::host::io);
> >
> > std::vector<std::unique_ptr<sdbusplus::bus::match::match>> matches;
> >     //Start tracking power state
> > std::unique_ptr<sdbusplus::bus::match::match> hostMonitor =
> >         ampere::host::startHostStateMonitor();
> >     matches.emplace_back(std::move(hostMonitor));
> >
> >     /* wait for the signal */
> >     ampere::host::io.run();
> > But when start io.run(), phosphor-hwmon will stop reading sensors.
>
> There is already an sdbusplus loop running, it's in Mainloop::run().
>
> >
> >     > 2. When I call "ipmitool power off" the host, there is a gap
> >     between
> >     > the time I trigger GPIO to power off the chassis and the time Dbus
> >     > property CurrentHostState is updated.
> >     > In this gap, the phosphor-hwmon is still reading sensors. And this
> >     > causes the threshold warnings or errors. I want to avoid this.
> >     >
> >     > Do you have any suggestions to avoid these issues?
> >     >
> >
> >     I can't think of anything at the moment.  Maybe someone else has
> >     an idea
> >     here.
> >
> >     > Others question:
> >     > I saw that phosphor-hwmon is registering an event to smbus and
> >     trigger
> >     > the event after each 1 second to read sensors.
> >     > Can I change the phosphor-hwmon code to integrate one dbus
> >     signal event?
> >     > Which will be triggered when there is changing in dbus property.
> >
> >     I'm not sure I understand what you're asking for here. Right now it
> >     will do 1 second reads (the period is
> >     configurable) and send a properties changed signal for each sensor on
> >     D-Bus only when the value changes.
> >
> > [Thu] I'm asking for how to add a signal to current phosphor-hwmon
> > framework as comment 1.
> >
> >     >
> >     > I knew how to create a service which adds the call back function
> >     when
> >     > there is change in dbus property.
> >     > But don't know how to intergrace it to hwmon.
> >     >
> >     > Regards.
> >     > Thu Nguyen.
> >     >
> >     >
> >     >
> >     > On Fri, Oct 23, 2020 at 5:45 AM Thu Ba Nguyen
> >     <tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>
> >     > <mailto:tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>>>
> >     wrote:
> >     >
> >     >     Just remove all of added code, rebase the phosphor-hwmon
> >     source to
> >     >     commit
> >     >     "5906173 (12 months ago) Brad Bishop: build: add support for
> >     >     building with meson"
> >     >
> >     >     Add the include:
> >     >     #include<sdbusplus/asio/connection.hpp>
> >     >     I can see the error
> >     >     |
> >     >
> >
>   /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:
> >     >     phosphor_hwmon_readd-readd.o: undefined reference to symbol
> >     >     'pthread_key_delete@@GLIBC_2.4'
> >     >     |
> >     >
> >
>   /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:
> >     >
> >
>   /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0:
> >     >     error adding symbols: DSO missing from command line
> >     >     | collect2: error: ld returned 1 exit status
> >     >     | make[2]: *** [Makefile:643: phosphor-hwmon-readd] Error 1
> >     >     | make[2]: Leaving directory
> >     >
> >
>   '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build'
> >     >     | make[1]: *** [Makefile:801: all-recursive] Error 1
> >     >     | make[1]: Leaving directory
> >     >
> >
>   '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build'
> >     >     | make: *** [Makefile:524: all] Error 2
> >     >     | ERROR: oe_runmake failed
> >     >     | WARNING: exit code 1 from a shell command.
> >     >     | ERROR: Execution of
> >     >
> >
>   '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/temp/run.do_compile.2045'
> >     >     failed with exit code 1:
> >     >     | Makefile:800: target 'check-valgrind-recursive' given more
> >     than
> >     >     once in the same rule
> >     >     | Makefile:800: target 'check-valgrind-memcheck-recursive'
> given
> >     >     more than once in the same rule
> >     >     | Makefile:800: target 'check-valgrind-helgrind-recursive'
> given
> >     >     more than once in the same rule
> >     >     | Makefile:800: target 'check-valgrind-drd-recursive' given
> more
> >     >     than once in the same rule
> >     >     | Makefile:800: target 'check-valgrind-sgcheck-recursive' given
> >     >     more than once in the same rule
> >     >     | make  all-recursive
> >     >
> >     >     I think we should add thread lib.
> >     >
> >     >     Regards.
> >     >     Thu Nguyen.
> >     >
> >     >     On Thu, Oct 22, 2020 at 10:51 PM Matt Spinler
> >     >     <mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>
> >     <mailto:mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>>>
> >     wrote:
> >     >
> >     >
> >     >
> >     >         On 10/22/2020 9:49 AM, Thu Ba Nguyen wrote:
> >     >         > I started on supporting enable/disable host sensors.
> >     >         Everythings is
> >     >         > fine until I...
> >     >         > This Message Is From an External Sender
> >     >         > This message came from outside your organization.
> >     >         >
> >     >         > I started on supporting enable/disable host sensors.
> >     >         > Everythings is fine until I add code to monitor host
> >     status
> >     >         as below.
> >     >         > bool MainLoop::isHostOn(void)
> >     >         > {
> >     >         > char buff[128];
> >     >         > if (!powerMatch)
> >     >         > {
> >     >         > log<level::ERR>("Power Match Not Created");
> >     >         > }
> >     >         > sprintf(buff, "isHostOn powerStatusOn:
> >     %d\n",powerStatusOn);
> >     >         > log<level::INFO>(buff);
> >     >         > return powerStatusOn;
> >     >         > }
> >     >         > std::shared_ptr<sdbusplus::bus::match::match>
> >     >         > MainLoop::startHostStateMonitor(void) {
> >     >         > return std::make_shared<sdbusplus::bus::match::match>(
> >     >         > *conn,
> >     >         >
> >     "type='signal',interface='org.freedesktop.DBus.Properties',"
> >     >         >
> >     >
>  "member='PropertiesChanged',arg0='xyz.openbmc_project.State.Host'",
> >     >         > [](sdbusplus::message::message &msg) {
> >     >         > std::string interfaceName;
> >     >         > boost::container::flat_map<std::string,
> >     >         std::variant<std::string>>
> >     >         > propertiesChanged;
> >     >         > try {
> >     >         > msg.read(interfaceName, propertiesChanged);
> >     >         > } catch (std::exception &e) {
> >     >         > log<level::ERR>("Unable to read host state\n");
> >     >         > return;
> >     >         > }
> >     >         > // We only want to check for CurrentHostState
> >     >         > if (propertiesChanged.begin()->first !=
> >     "CurrentHostState") {
> >     >         > return;
> >     >         > }
> >     >         > auto findState = propertiesChanged.find(powProperty);
> >     >         > if (findState != propertiesChanged.end())
> >     >         > {
> >     >         > powerStatusOn = boost::ends_with(
> >     >         > std::get<std::string>(findState->second), "Running");
> >     >         > }
> >     >         > powerMatch = true;
> >     >         > });
> >     >         > }
> >     >         > void MainLoop::read()
> >     >         > {
> >     >         > // TODO: Issue#3 - Need to make calls to the dbus sensor
> >     >         cache here to
> >     >         > // ensure the objects all exist?
> >     >         > /* Host changed state from On to Off */
> >     >         > if (!isHostOn() && (lastPowerState == HOST_ON ||
> >     >         > lastPowerState == HOST_NA)) {
> >     >         > removeHostSensors();
> >     >         > lastPowerState = HOST_OFF;
> >     >         > }
> >     >         > /* Host changed state from Off to On */
> >     >         > if (isHostOn() && lastPowerState == HOST_OFF) {
> >     >         > addDroppedHostSensors();
> >     >         > lastPowerState = HOST_ON;
> >     >         > }
> >     >         > When build openBMC I got error:
> >     >         >
> >     >
> >
>   tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0:
> >     >
> >     >         > error adding symbols: DSO missing from command line
> >     >         > | collect2: error: ld returned 1 exit status
> >     >         > | make[2]: *** [Makefile:643: phosphor-hwmon-readd]
> >     Error 1
> >     >         >
> >     >         > It seems I need adding the threads lib to defend lib.
> >     >         > Any suggestion to add threads lib to build configuration?
> >     >         >
> >     >
> >     >         That must be because you're using that single boost
> >     function?
> >     >         While you
> >     >         could add the dependency,
> >     >         the ideal thing to do since this repo already uses
> >     >         phosphor-dbus-interfaces is to use the function:
> >     >
> >     >                  /** @brief Convert a string to an appropriate
> >     enum value.
> >     >                   *  @param[in] s - The string to convert in the
> >     form of
> >     >                   * "xyz.openbmc_project.State.Host.<value name>"
> >     >                   *  @return - The enum value.
> >     >                   */
> >     >                  static HostState convertHostStateFromString(const
> >     >         std::string& s);
> >     >
> >     >         to convert it to the actual HostState enum to check
> against:
> >     >
> >     >                  enum class HostState
> >     >                  {
> >     >                      Off,
> >     >                      Running,
> >     >                      Quiesced,
> >     >                      DiagnosticMode,
> >     >                  };
> >     >
> >     >         This is all in xyz/openbmc_project/State/Host/server.hpp
> >     >         provided by
> >     >         phosphor-dbus-interfaces.
> >     >
> >     >         > Thanks.
> >     >         > Thu.
> >     >         >
> >     >         > On Wed, Oct 21, 2020 at 11:54 PM Thu Ba Nguyen
> >     >         <tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>
> >     <mailto:tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>>
> >     >         > <mailto:tbnguyen1985@gmail.com
> >     <mailto:tbnguyen1985@gmail.com>
> >     >         <mailto:tbnguyen1985@gmail.com
> >     <mailto:tbnguyen1985@gmail.com>>>> wrote:
> >     >         >
> >     >         >     Hi Vijay,
> >     >         >
> >     >         >     I took a look on entity-manager and openbmc source.
> >     >         >     Don't have many companies  using entity-manager
> >     model to
> >     >         support
> >     >         >     sensors.
> >     >         >
> >     >         >     Regards
> >     >         >     Thu Nguyen.
> >     >         >
> >     >         >
> >     >         >     On Wed, Oct 21, 2020 at 7:15 AM Vijay Khemka
> >     >         <vijaykhemka@fb.com <mailto:vijaykhemka@fb.com>
> >     <mailto:vijaykhemka@fb.com <mailto:vijaykhemka@fb.com>>
> >     >         >     <mailto:vijaykhemka@fb.com
> >     <mailto:vijaykhemka@fb.com> <mailto:vijaykhemka@fb.com
> >     <mailto:vijaykhemka@fb.com>>>>
> >     >         wrote:
> >     >         >
> >     >         >         *From: *openbmc
> >     >         >
> >      <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org
> >     <mailto:fb.com@lists.ozlabs.org>
> >     >         <mailto:fb.com@lists.ozlabs.org
> >     <mailto:fb.com@lists.ozlabs.org>>
> >     >         >         <mailto:fb.com@lists.ozlabs.org
> >     <mailto:fb.com@lists.ozlabs.org>
> >     >         <mailto:fb.com@lists.ozlabs.org
> >     <mailto:fb.com@lists.ozlabs.org>>>> on behalf of Thu Ba Nguyen
> >     >         >         <tbnguyen1985@gmail.com
> >     <mailto:tbnguyen1985@gmail.com>
> >     >         <mailto:tbnguyen1985@gmail.com
> >     <mailto:tbnguyen1985@gmail.com>> <mailto:tbnguyen1985@gmail.com
> >     <mailto:tbnguyen1985@gmail.com>
> >     >         <mailto:tbnguyen1985@gmail.com
> >     <mailto:tbnguyen1985@gmail.com>>>>
> >     >         >         *Date: *Monday, October 19, 2020 at 11:23 AM
> >     >         >         *To: *Ed Tanous <ed@tanous.net
> >     <mailto:ed@tanous.net>
> >     >         <mailto:ed@tanous.net <mailto:ed@tanous.net>>
> >     <mailto:ed@tanous.net <mailto:ed@tanous.net>
> >     >         <mailto:ed@tanous.net <mailto:ed@tanous.net>>>>
> >     >         >         *Cc: *OpenBMC Maillist
> >     <openbmc@lists.ozlabs.org <mailto:openbmc@lists.ozlabs.org>
> >     >         <mailto:openbmc@lists.ozlabs.org
> >     <mailto:openbmc@lists.ozlabs.org>>
> >     >         >         <mailto:openbmc@lists.ozlabs.org
> >     <mailto:openbmc@lists.ozlabs.org>
> >     >         <mailto:openbmc@lists.ozlabs.org
> >     <mailto:openbmc@lists.ozlabs.org>>>>
> >     >         >         *Subject: *Re: Enable/Disable some sensors
> >     when Host
> >     >         On/Off
> >     >         >
> >     >         >         Hi Ed Tanous,
> >     >         >
> >     >         >         > Thanks for your info,
> >     >         >
> >     >         >         > But in your platform we are using
> phosphor-hwmon
> >     >         to manage
> >     >         >         sensors.
> >     >         >
> >     >         >         > We don't use entity-manager.
> >     >         >
> >     >         >         > As I knew we can't use both entity-manager and
> >     >         >         phosphor-hwmon for one project.
> >     >         >
> >     >         >         You can use both but for different sensors.
> >     You can
> >     >         decide
> >     >         >         what sensors to configure
> >     >         >
> >     >         >         via EM/dbus-sensors and which one for
> >     phosphor-hwmon.
> >     >         >
> >     >         >         Regards
> >     >         >
> >     >         >         Thu Nguyen.
> >     >         >
> >     >
> >
>
>

--000000000000448bda05b3644a7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span s=
tyle=3D"color:rgb(0,0,0);font-family:-webkit-standard;font-size:medium">The=
re is already an sdbusplus loop running, it&#39;s in Mainloop::run().</span=
><br></div><div><span style=3D"color:rgb(0,0,0);font-family:-webkit-standar=
d;font-size:medium">[Thu] I think phosphor-hwmon is using the timer for=C2=
=A0</span><span style=3D"color:rgb(0,0,0);font-family:-webkit-standard;font=
-size:medium">Mainloop::run() which triggers each 1 seconds.</span></div><d=
iv><span style=3D"color:rgb(0,0,0);font-family:-webkit-standard;font-size:m=
edium">Is this right?</span></div><div><span style=3D"color:rgb(0,0,0);font=
-family:-webkit-standard;font-size:medium">To support signal the changing i=
n dbus property, we need a service which listens the dbus signal, right?</s=
pan></div><div><span style=3D"color:rgb(0,0,0);font-family:-webkit-standard=
;font-size:medium">I&#39;m still fresh in C++ and dbus code. So please corr=
ect me if I&#39;m wrong.</span></div><div><span style=3D"color:rgb(0,0,0);f=
ont-family:-webkit-standard;font-size:medium"><br></span></div><div><span s=
tyle=3D"color:rgb(0,0,0);font-family:-webkit-standard;font-size:medium">Tha=
nks.</span></div><div><span style=3D"color:rgb(0,0,0);font-family:-webkit-s=
tandard;font-size:medium">Thu Nguyen.</span></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 6, 2020 at 3:52 AM =
Matt Spinler &lt;<a href=3D"mailto:mspinler@linux.ibm.com">mspinler@linux.i=
bm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;borde=
r-left-color:rgb(204,204,204);padding-left:1ex"><br>
<br>
On 11/4/2020 4:18 PM, Thu Ba Nguyen wrote:<br>
&gt; Please=C2=A0see my comments below. Thanks. Thu Nguyen. On Wed, Nov 4, =
2020 <br>
&gt; at 11:31 PM...<br>
&gt; This Message Is From an External Sender<br>
&gt; This message came from outside your organization.<br>
&gt;<br>
&gt; Please=C2=A0see my comments below.<br>
&gt;<br>
&gt; Thanks.<br>
&gt; Thu Nguyen.<br>
&gt;<br>
&gt; On Wed, Nov 4, 2020 at 11:31 PM Matt Spinler &lt;<a href=3D"mailto:msp=
inler@linux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:mspinler@linux.ibm.com" target=3D"_blank"=
>mspinler@linux.ibm.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 11/4/2020 3:15 AM, Thu Ba Nguyen wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi=C2=A0Matt, I implemented &quot;Inactive the=
 host sensors&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0phosphor-hwmon<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; use below...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This Message Is From an External Sender<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This message came from outside your organizati=
on.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Hi=C2=A0Matt,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I implemented &quot;Inactive the host sensors&=
quot; in phosphor-hwmon use<br>
&gt;=C2=A0 =C2=A0 =C2=A0below<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; approaching:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. Add one option in Sensors configuration, ph=
osphor-hwmon will<br>
&gt;=C2=A0 =C2=A0 =C2=A0parse<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; this option and add host sensors to _hostSenso=
rs list.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. In mainloop::read() before going to loop to=
 read the sensors<br>
&gt;=C2=A0 =C2=A0 =C2=A0in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; reading list. Query dbus to get CurrentHostSta=
te property.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; This property belongs to service &quot;xyz.ope=
nbmc_project.State.Host&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Based on the status of this property, identify=
 host status.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; If the host is off, remove the host sensors fr=
om _state list and<br>
&gt;=C2=A0 =C2=A0 =C2=A0dbus.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I expected the users wouldn&#39;t see the host=
 sensors on the BMC<br>
&gt;=C2=A0 =C2=A0 =C2=A0Web when<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the host is off.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; If the host is on, add the host sensors back t=
o _state list and<br>
&gt;=C2=A0 =C2=A0 =C2=A0also dbus.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; The code is working. But I have two issues wit=
h this approaching:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. Too many transactions to get dbus property =
CurrentHostState.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; In my case, I have 6 services to monitor=C2=A0=
the sensors which<br>
&gt;=C2=A0 =C2=A0 =C2=A0concern the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; host.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; With the current interval 1 second of phosphor=
-hwmon, I have 6<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; transactions to get CurrentHostState per secon=
ds.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The better way to implement this would be to read C=
urrentHostState<br>
&gt;=C2=A0 =C2=A0 =C2=A0once<br>
&gt;=C2=A0 =C2=A0 =C2=A0on startup, and then register for<br>
&gt;=C2=A0 =C2=A0 =C2=A0propertiesChanged signals for it and provide a call=
back to update an<br>
&gt;=C2=A0 =C2=A0 =C2=A0internal host state variable.<br>
&gt;<br>
&gt; [Thu] Yes, This is what I&#39;m planning to do. But don&#39;t know how=
 to add <br>
&gt; a propertiesChanged signals<br>
&gt; to the current phosphor-hwmon framework.<br>
&gt;<br>
&gt; I usually use below code to add a signal to dbus.<br>
&gt; =C2=A0 =C2=A0 boost::asio::io_service io;<br>
&gt; =C2=A0 =C2=A0 ampere::host::conn =3D<br>
&gt; std::make_shared&lt;sdbusplus::asio::connection&gt;(ampere::host::io);=
<br>
&gt;<br>
&gt; std::vector&lt;std::unique_ptr&lt;sdbusplus::bus::match::match&gt;&gt;=
 matches;<br>
&gt; =C2=A0 =C2=A0 //Start tracking power state<br>
&gt; std::unique_ptr&lt;sdbusplus::bus::match::match&gt; hostMonitor =3D<br=
>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 ampere::host::startHostStateMonitor();<br>
&gt; =C2=A0 =C2=A0 matches.emplace_back(std::move(hostMonitor));<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 /* wait for the signal */<br>
&gt; =C2=A0 =C2=A0 ampere::host::io.run();<br>
&gt; But when start io.run(), phosphor-hwmon will stop reading sensors.<br>
<br>
There is already an sdbusplus loop running, it&#39;s in Mainloop::run().<br=
>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. When I call &quot;ipmitool power off&quot; =
the host, there is a gap<br>
&gt;=C2=A0 =C2=A0 =C2=A0between<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the time I trigger GPIO to power off the chass=
is and the time Dbus<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; property CurrentHostState is updated.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; In this gap, the phosphor-hwmon is still readi=
ng sensors. And this<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; causes the threshold=C2=A0warnings or errors. =
I want to avoid this.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Do you have any suggestions to avoid these iss=
ues?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I can&#39;t think of anything at the moment.=C2=A0 =
Maybe someone else has<br>
&gt;=C2=A0 =C2=A0 =C2=A0an idea<br>
&gt;=C2=A0 =C2=A0 =C2=A0here.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Others question:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I saw that phosphor-hwmon is registering an ev=
ent to smbus and<br>
&gt;=C2=A0 =C2=A0 =C2=A0trigger<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the event after each 1 second to read sensors.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Can I change the phosphor-hwmon code to integr=
ate=C2=A0one dbus<br>
&gt;=C2=A0 =C2=A0 =C2=A0signal event?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Which will be triggered when there is changing=
 in dbus property.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;m not sure I understand what you&#39;re askin=
g for here. Right now it<br>
&gt;=C2=A0 =C2=A0 =C2=A0will do 1 second reads (the period is<br>
&gt;=C2=A0 =C2=A0 =C2=A0configurable) and send a properties changed signal =
for each sensor on<br>
&gt;=C2=A0 =C2=A0 =C2=A0D-Bus only when the value changes.<br>
&gt;<br>
&gt; [Thu] I&#39;m asking for how to add a signal to current phosphor-hwmon=
 <br>
&gt; framework as comment 1.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; I knew how to create a service which adds the =
call back function<br>
&gt;=C2=A0 =C2=A0 =C2=A0when<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; there is change in dbus property.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; But don&#39;t know how to intergrace it to hwm=
on.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Regards.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Thu Nguyen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Fri, Oct 23, 2020 at 5:45 AM Thu Ba Nguyen<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:tbnguyen1985@gmail.com" targe=
t=3D"_blank">tbnguyen1985@gmail.com</a> &lt;mailto:<a href=3D"mailto:tbnguy=
en1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:tbnguyen1985@gmai=
l.com" target=3D"_blank">tbnguyen1985@gmail.com</a> &lt;mailto:<a href=3D"m=
ailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a>&=
gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Just remove all of added co=
de, rebase the phosphor-hwmon<br>
&gt;=C2=A0 =C2=A0 =C2=A0source to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&quot;5906173 (12 months ag=
o) Brad Bishop: build: add support for<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0building with meson&quot;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Add the include:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0#include&lt;sdbusplus/asio/=
connection.hpp&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I can see the error<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0/openbmc/jade_build/tmp/work/arm1176jzs-openb=
mc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot=
-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-g=
nueabi/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0phosphor_hwmon_readd-readd.=
o: undefined reference to symbol<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&#39;pthread_key_delete@@GL=
IBC_2.4&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0/openbmc/jade_build/tmp/work/arm1176jzs-openb=
mc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot=
-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-g=
nueabi/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0/openbmc/jade_build/tmp/work/arm1176jzs-openb=
mc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot=
/lib/libpthread.so.0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0error adding symbols: DSO m=
issing from command line<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| collect2: error: ld retur=
ned 1 exit status<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| make[2]: *** [Makefile:64=
3: phosphor-hwmon-readd] Error 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| make[2]: Leaving director=
y<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&#39;/openbmc/jade_build/tmp/work/arm1176jzs-=
openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build&#39=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| make[1]: *** [Makefile:80=
1: all-recursive] Error 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| make[1]: Leaving director=
y<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&#39;/openbmc/jade_build/tmp/work/arm1176jzs-=
openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build&#39=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| make: *** [Makefile:524: =
all] Error 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| ERROR: oe_runmake failed<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| WARNING: exit code 1 from=
 a shell command.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| ERROR: Execution of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&#39;/openbmc/jade_build/tmp/work/arm1176jzs-=
openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/temp/run.=
do_compile.2045&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0failed with exit code 1:<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| Makefile:800: target &#39=
;check-valgrind-recursive&#39; given more<br>
&gt;=C2=A0 =C2=A0 =C2=A0than<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0once in the same rule<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| Makefile:800: target &#39=
;check-valgrind-memcheck-recursive&#39; given<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0more than once in the same =
rule<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| Makefile:800: target &#39=
;check-valgrind-helgrind-recursive&#39; given<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0more than once in the same =
rule<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| Makefile:800: target &#39=
;check-valgrind-drd-recursive&#39; given more<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0than once in the same rule<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| Makefile:800: target &#39=
;check-valgrind-sgcheck-recursive&#39; given<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0more than once in the same =
rule<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0| make =C2=A0all-recursive<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I think we should add threa=
d lib.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Regards.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Thu Nguyen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Oct 22, 2020 at 10:=
51 PM Matt Spinler<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:mspin=
ler@linux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a> &lt;mailto:=
<a href=3D"mailto:mspinler@linux.ibm.com" target=3D"_blank">mspinler@linux.=
ibm.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mspinler@linux.ibm.com=
" target=3D"_blank">mspinler@linux.ibm.com</a> &lt;mailto:<a href=3D"mailto=
:mspinler@linux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a>&gt;&g=
t;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 10/22/2020=
 9:49 AM, Thu Ba Nguyen wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I starte=
d on supporting enable/disable host sensors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Everythings i=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fine unt=
il=C2=A0I...<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This Mes=
sage Is From an External Sender<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This mes=
sage came from outside your organization.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I starte=
d on supporting enable/disable host sensors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Everythi=
ngs is fine until=C2=A0I add code to monitor host<br>
&gt;=C2=A0 =C2=A0 =C2=A0status<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as below.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; bool Mai=
nLoop::isHostOn(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; char buf=
f[128];<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if (!pow=
erMatch)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; log&lt;l=
evel::ERR&gt;(&quot;Power Match Not Created&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; sprintf(=
buff, &quot;isHostOn powerStatusOn:<br>
&gt;=C2=A0 =C2=A0 =C2=A0%d\n&quot;,powerStatusOn);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; log&lt;l=
evel::INFO&gt;(buff);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; return p=
owerStatusOn;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; std::sha=
red_ptr&lt;sdbusplus::bus::match::match&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; MainLoop=
::startHostStateMonitor(void) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; return s=
td::make_shared&lt;sdbusplus::bus::match::match&gt;(<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; *conn,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;type=3D&#39;signal&#39;,interface=3D&#39;org.=
freedesktop.DBus.Properties&#39;,&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; =C2=A0&quot;member=3D&#39;PropertiesChanged&#3=
9;,arg0=3D&#39;xyz.openbmc_project.State.Host&#39;&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [](sdbus=
plus::message::message &amp;msg) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; std::str=
ing interfaceName;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; boost::c=
ontainer::flat_map&lt;std::string,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::variant&=
lt;std::string&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; properti=
esChanged;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; try {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; msg.read=
(interfaceName, propertiesChanged);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; } catch =
(std::exception &amp;e) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; log&lt;l=
evel::ERR&gt;(&quot;Unable to read host state\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; return;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; // We on=
ly want to check for CurrentHostState<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if (prop=
ertiesChanged.begin()-&gt;first !=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;CurrentHostState&quot;) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; return;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; auto fin=
dState =3D propertiesChanged.find(powProperty);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if (find=
State !=3D propertiesChanged.end())<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; powerSta=
tusOn =3D boost::ends_with(<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; std::get=
&lt;std::string&gt;(findState-&gt;second), &quot;Running&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; powerMat=
ch =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; });<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; void Mai=
nLoop::read()<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; // TODO:=
 Issue#3 - Need to make calls to the dbus sensor<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache here to=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; // ensur=
e the objects all exist?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /* Host =
changed state from On to Off */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if (!isH=
ostOn() &amp;&amp; (lastPowerState =3D=3D HOST_ON ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; lastPowe=
rState =3D=3D HOST_NA)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; removeHo=
stSensors();<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; lastPowe=
rState =3D HOST_OFF;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /* Host =
changed state from Off to On */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if (isHo=
stOn() &amp;&amp; lastPowerState =3D=3D HOST_OFF) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; addDropp=
edHostSensors();<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; lastPowe=
rState =3D HOST_ON;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; When bui=
ld openBMC I got error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0tmp/work/arm1176jzs-openbmc-linux-gnueabi/pho=
sphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; error ad=
ding symbols: DSO missing from command line<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; | collec=
t2: error: ld returned 1 exit status<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; | make[2=
]: *** [Makefile:643: phosphor-hwmon-readd]<br>
&gt;=C2=A0 =C2=A0 =C2=A0Error 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; It seems=
 I need adding the threads lib to defend lib.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any sugg=
estion to add threads lib to build configuration?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0That must be =
because you&#39;re using that single boost<br>
&gt;=C2=A0 =C2=A0 =C2=A0function?<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0While you<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0could add the=
 dependency,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the ideal thi=
ng to do since this repo already uses<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phosphor-dbus=
-interfaces is to use the function:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @brief Convert a string to an appr=
opriate<br>
&gt;=C2=A0 =C2=A0 =C2=A0enum value.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 @param[in] s - The strin=
g to convert in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0form of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * &quot;xyz.openbmc_project.Stat=
e.Host.&lt;value name&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 @return - The enum value=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static HostState convertHostStateFromS=
tring(const<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::string&a=
mp; s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to convert it=
 to the actual HostState enum to check against:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum class HostState<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Off,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Running,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Quiesced,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DiagnosticMode=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is all i=
n xyz/openbmc_project/State/Host/server.hpp<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0provided by<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phosphor-dbus=
-interfaces.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thu.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Wed, =
Oct 21, 2020 at 11:54 PM Thu Ba Nguyen<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com=
</a> &lt;mailto:<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank"=
>tbnguyen1985@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tbnguyen1985@gmail.com=
" target=3D"_blank">tbnguyen1985@gmail.com</a> &lt;mailto:<a href=3D"mailto=
:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt;&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mail=
to:<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985=
@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tbnguyen1985@gmail.com=
" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmai=
l.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tbnguyen1985@gmail.com=
" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt;&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Hi Vijay,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0I took a look on entity-manager=C2=A0and openbmc source.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Don&#39;t have=C2=A0many companies =C2=A0using entity-manager<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0model to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0support<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0sensors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0Thu Nguyen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0On Wed, Oct 21, 2020 at 7:15 AM Vijay Khemka<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a> &lt=
;mailto:<a href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka=
@fb.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vijaykhemka@fb.com" ta=
rget=3D"_blank">vijaykhemka@fb.com</a> &lt;mailto:<a href=3D"mailto:vijaykh=
emka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vijaykhemka@fb.com" target=3D"_bl=
ank">vijaykhemka@fb.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vijaykhemka@fb.com" ta=
rget=3D"_blank">vijaykhemka@fb.com</a>&gt; &lt;mailto:<a href=3D"mailto:vij=
aykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vijaykhemka@fb.com" ta=
rget=3D"_blank">vijaykhemka@fb.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0*From: *openbmc<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&lt;openbmc-bounces+vijaykhemka=3D<a href=3D"=
mailto:fb.com@lists.ozlabs.org" target=3D"_blank">fb.com@lists.ozlabs.org</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:fb.com@lists.ozlabs.or=
g" target=3D"_blank">fb.com@lists.ozlabs.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_blank">fb.com@lists.ozl=
abs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:fb.com@lists.ozlabs.or=
g" target=3D"_blank">fb.com@lists.ozlabs.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:fb.com@lists.ozlabs=
.org" target=3D"_blank">fb.com@lists.ozlabs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:fb.com@lists.ozlabs.or=
g" target=3D"_blank">fb.com@lists.ozlabs.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_blank">fb.com@lists.ozl=
abs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:fb.com@lists.ozlabs.or=
g" target=3D"_blank">fb.com@lists.ozlabs.org</a>&gt;&gt;&gt;&gt; on behalf =
of Thu Ba Nguyen<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:tbnguyen1985@gmail.com" ta=
rget=3D"_blank">tbnguyen1985@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tbnguyen1985@gmail.com=
" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmai=
l.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tbnguyen1985@gmail.com=
" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt;&gt; &lt;mailto:<a href=
=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tbnguyen1985@gmail.com=
" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmai=
l.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tbnguyen1985@gmail.com=
" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0*Date: *Monday, October 19, 2020 at 11:23 AM<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0*To: *Ed Tanous &lt;<a href=3D"mailto:ed@tanous.=
net" target=3D"_blank">ed@tanous.net</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ed@tanous.net" target=
=3D"_blank">ed@tanous.net</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a> &lt;mail=
to:<a href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a>&gt;=
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ed@tanous.net" target=
=3D"_blank">ed@tanous.net</a> &lt;mailto:<a href=3D"mailto:ed@tanous.net" t=
arget=3D"_blank">ed@tanous.net</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a> &lt;mail=
to:<a href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a>&gt;=
&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0*Cc: *OpenBMC Maillist<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" tar=
get=3D"_blank">openbmc@lists.ozlabs.org</a> &lt;mailto:<a href=3D"mailto:op=
enbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.o=
zlabs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openbmc@lists.ozlabs.o=
rg" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openbmc@lists.ozlab=
s.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openbmc@lists.ozlabs.o=
rg" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.o=
zlabs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openbmc@lists.ozlabs.o=
rg" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0*Subject: *Re: Enable/Disable some sensors<br>
&gt;=C2=A0 =C2=A0 =C2=A0when Host<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On/Off<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Ed Tanous,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks for your info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; But in your platform we are using phosphor-=
hwmon<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to manage<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0sensors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; We don&#39;t use entity-manager.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; As I knew we can&#39;t use both entity-mana=
ger and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0phosphor-hwmon for one project.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0You can use both but for different sensors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0You can<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decide<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0what sensors to configure<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0via EM/dbus-sensors and which one for<br>
&gt;=C2=A0 =C2=A0 =C2=A0phosphor-hwmon.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Thu Nguyen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
<br>
</blockquote></div></div></div></div>

--000000000000448bda05b3644a7f--
