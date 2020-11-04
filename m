Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2F2A704D
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 23:19:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRLfQ2sw2zDqTn
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 09:19:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L5aPvUmb; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRLdW1qKbzDqf2
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 09:18:21 +1100 (AEDT)
Received: by mail-qk1-x736.google.com with SMTP id 11so1355227qkd.5
 for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2020 14:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FZILVlG1RGBWSQB6FDvJKPoM9Ylp+0hYQuuoIDJEpn8=;
 b=L5aPvUmbyQTkmEGZcaZoaZEhfK5noMc77o6hgR29HagO3tYB47K+1d5W/y0PptklJ7
 8++q1RDWDgMRrj7n/bzxPLWP+4nimsfvRga5cpYIr8Q3dZ/XHvNuIWYHjsuINlo1D0Bs
 35Eym7cFJ+OzSqpdk0jHW6oJ6Vyq+k6GSv6WSU09UwC//enhy/4tIgM63phyHdBMQI9X
 0LWVP5zdZjaKalcLvhslUZxW3A9xiZ6+5jmoeR4BTjqhldE3PaKqyPuPnEx0uVNG7BAC
 vhyzVbWUAfW/RTjRIwzePQBNLYZ4ckGMLoZtmuU/aC6DNP6ETBJwzMRPQpOAFVrmMhv1
 /fiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FZILVlG1RGBWSQB6FDvJKPoM9Ylp+0hYQuuoIDJEpn8=;
 b=oH6g+d4fzxBunCi8G1xkfbWnfU7Bi6FJARJhY2x0iikXDkGNexKAc3dMSJZfUUV/7F
 ch1I2a1Y1oM229NM6x7DwPk32cX2/G9y7HTUWM5XO8wvAzuUOe6c1qiu20Jcenpiwg1M
 K5dUtiaMNwOV66B3vzOd8XCNJY+fALBhP1E3QRa0VWmRUrABcY8bzTHCE+LOw7B4MYyz
 MVOuzV2H9nf+x9otgXcxyQ+n3qNguQJ8wOnfSFWJZG7V13G5kSDbncQFcNOBvjORRxaF
 2rSZDsFjDqBXRsQ9iPDQhESlZAaYLCVdqYGXQe5WivqM5WU5LlVqSKu9cWkv7yQzDLbb
 46mw==
X-Gm-Message-State: AOAM53114EryzTKUjUUDXu2Doj4w4OCJvdYZdZLXqARCVld7wxUKKaKm
 idVU8gJy5pxK6dbFtinfoTw8FAVS5v2M8T7D2Yc=
X-Google-Smtp-Source: ABdhPJxk3siKbzumNr861iBprcsJpgvCm+U31jolSRoRTOP6AP/zQgbDDkvJ7aCr+DWGWMoPtcfuZbVjQBO0AzLydZw=
X-Received: by 2002:a37:474b:: with SMTP id u72mr348438qka.333.1604528297848; 
 Wed, 04 Nov 2020 14:18:17 -0800 (PST)
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
In-Reply-To: <14c0a498-498c-8447-685b-c97d04c699ab@linux.ibm.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Thu, 5 Nov 2020 05:18:06 +0700
Message-ID: <CALioo347c8tYxeGqfhZyUAN-WCsph8a6Uqea-srvNh5OXVotKQ@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000039b26905b34f5bab"
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

--00000000000039b26905b34f5bab
Content-Type: text/plain; charset="UTF-8"

Please see my comments below.

Thanks.
Thu Nguyen.

On Wed, Nov 4, 2020 at 11:31 PM Matt Spinler <mspinler@linux.ibm.com> wrote:

>
>
> On 11/4/2020 3:15 AM, Thu Ba Nguyen wrote:
> > Hi Matt, I implemented "Inactive the host sensors" in phosphor-hwmon
> > use below...
> > This Message Is From an External Sender
> > This message came from outside your organization.
> >
> > Hi Matt,
> >
> > I implemented "Inactive the host sensors" in phosphor-hwmon use below
> > approaching:
> > 1. Add one option in Sensors configuration, phosphor-hwmon will parse
> > this option and add host sensors to _hostSensors list.
> > 2. In mainloop::read() before going to loop to read the sensors in the
> > reading list. Query dbus to get CurrentHostState property.
> > This property belongs to service "xyz.openbmc_project.State.Host".
> > Based on the status of this property, identify host status.
> > If the host is off, remove the host sensors from _state list and dbus.
> > I expected the users wouldn't see the host sensors on the BMC Web when
> > the host is off.
> > If the host is on, add the host sensors back to _state list and also
> dbus.
> >
> > The code is working. But I have two issues with this approaching:
> >
> > 1. Too many transactions to get dbus property CurrentHostState.
> > In my case, I have 6 services to monitor the sensors which concern the
> > host.
> > With the current interval 1 second of phosphor-hwmon, I have 6
> > transactions to get CurrentHostState per seconds.
>
> The better way to implement this would be to read CurrentHostState once
> on startup, and then register for
> propertiesChanged signals for it and provide a callback to update an
> internal host state variable.
>
[Thu] Yes, This is what I'm planning to do. But don't know how to add a
propertiesChanged signals
to the current phosphor-hwmon framework.

I usually use below code to add a signal to dbus.
    boost::asio::io_service io;
    ampere::host::conn =
      std::make_shared<sdbusplus::asio::connection>(ampere::host::io);

    std::vector<std::unique_ptr<sdbusplus::bus::match::match>> matches;
    //Start tracking power state
    std::unique_ptr<sdbusplus::bus::match::match> hostMonitor =
        ampere::host::startHostStateMonitor();
    matches.emplace_back(std::move(hostMonitor));

    /* wait for the signal */
    ampere::host::io.run();
But when start io.run(), phosphor-hwmon will stop reading sensors.

> 2. When I call "ipmitool power off" the host, there is a gap between
> > the time I trigger GPIO to power off the chassis and the time Dbus
> > property CurrentHostState is updated.
> > In this gap, the phosphor-hwmon is still reading sensors. And this
> > causes the threshold warnings or errors. I want to avoid this.
> >
> > Do you have any suggestions to avoid these issues?
> >
>
> I can't think of anything at the moment.  Maybe someone else has an idea
> here.
>
> > Others question:
> > I saw that phosphor-hwmon is registering an event to smbus and trigger
> > the event after each 1 second to read sensors.
> > Can I change the phosphor-hwmon code to integrate one dbus signal event?
> > Which will be triggered when there is changing in dbus property.
>
> I'm not sure I understand what you're asking for here.  Right now it
> will do 1 second reads (the period is
> configurable) and send a properties changed signal for each sensor on
> D-Bus only when the value changes.
>
[Thu] I'm asking for how to add a signal to current phosphor-hwmon
framework as comment 1.

> >
> > I knew how to create a service which adds the call back function when
> > there is change in dbus property.
> > But don't know how to intergrace it to hwmon.
> >
> > Regards.
> > Thu Nguyen.
> >
> >
> >
> > On Fri, Oct 23, 2020 at 5:45 AM Thu Ba Nguyen <tbnguyen1985@gmail.com
> > <mailto:tbnguyen1985@gmail.com>> wrote:
> >
> >     Just remove all of added code, rebase the phosphor-hwmon source to
> >     commit
> >     "5906173 (12 months ago) Brad Bishop: build: add support for
> >     building with meson"
> >
> >     Add the include:
> >     #include<sdbusplus/asio/connection.hpp>
> >     I can see the error
> >     |
> >
>  /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:
> >     phosphor_hwmon_readd-readd.o: undefined reference to symbol
> >     'pthread_key_delete@@GLIBC_2.4'
> >     |
> >
>  /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:
> >
>  /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0:
> >     error adding symbols: DSO missing from command line
> >     | collect2: error: ld returned 1 exit status
> >     | make[2]: *** [Makefile:643: phosphor-hwmon-readd] Error 1
> >     | make[2]: Leaving directory
> >
>  '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build'
> >     | make[1]: *** [Makefile:801: all-recursive] Error 1
> >     | make[1]: Leaving directory
> >
>  '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build'
> >     | make: *** [Makefile:524: all] Error 2
> >     | ERROR: oe_runmake failed
> >     | WARNING: exit code 1 from a shell command.
> >     | ERROR: Execution of
> >
>  '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/temp/run.do_compile.2045'
> >     failed with exit code 1:
> >     | Makefile:800: target 'check-valgrind-recursive' given more than
> >     once in the same rule
> >     | Makefile:800: target 'check-valgrind-memcheck-recursive' given
> >     more than once in the same rule
> >     | Makefile:800: target 'check-valgrind-helgrind-recursive' given
> >     more than once in the same rule
> >     | Makefile:800: target 'check-valgrind-drd-recursive' given more
> >     than once in the same rule
> >     | Makefile:800: target 'check-valgrind-sgcheck-recursive' given
> >     more than once in the same rule
> >     | make  all-recursive
> >
> >     I think we should add thread lib.
> >
> >     Regards.
> >     Thu Nguyen.
> >
> >     On Thu, Oct 22, 2020 at 10:51 PM Matt Spinler
> >     <mspinler@linux.ibm.com <mailto:mspinler@linux.ibm.com>> wrote:
> >
> >
> >
> >         On 10/22/2020 9:49 AM, Thu Ba Nguyen wrote:
> >         > I started on supporting enable/disable host sensors.
> >         Everythings is
> >         > fine until I...
> >         > This Message Is From an External Sender
> >         > This message came from outside your organization.
> >         >
> >         > I started on supporting enable/disable host sensors.
> >         > Everythings is fine until I add code to monitor host status
> >         as below.
> >         > bool MainLoop::isHostOn(void)
> >         > {
> >         > char buff[128];
> >         > if (!powerMatch)
> >         > {
> >         > log<level::ERR>("Power Match Not Created");
> >         > }
> >         > sprintf(buff, "isHostOn powerStatusOn: %d\n",powerStatusOn);
> >         > log<level::INFO>(buff);
> >         > return powerStatusOn;
> >         > }
> >         > std::shared_ptr<sdbusplus::bus::match::match>
> >         > MainLoop::startHostStateMonitor(void) {
> >         > return std::make_shared<sdbusplus::bus::match::match>(
> >         > *conn,
> >         > "type='signal',interface='org.freedesktop.DBus.Properties',"
> >         >
> >
>  "member='PropertiesChanged',arg0='xyz.openbmc_project.State.Host'",
> >         > [](sdbusplus::message::message &msg) {
> >         > std::string interfaceName;
> >         > boost::container::flat_map<std::string,
> >         std::variant<std::string>>
> >         > propertiesChanged;
> >         > try {
> >         > msg.read(interfaceName, propertiesChanged);
> >         > } catch (std::exception &e) {
> >         > log<level::ERR>("Unable to read host state\n");
> >         > return;
> >         > }
> >         > // We only want to check for CurrentHostState
> >         > if (propertiesChanged.begin()->first != "CurrentHostState") {
> >         > return;
> >         > }
> >         > auto findState = propertiesChanged.find(powProperty);
> >         > if (findState != propertiesChanged.end())
> >         > {
> >         > powerStatusOn = boost::ends_with(
> >         > std::get<std::string>(findState->second), "Running");
> >         > }
> >         > powerMatch = true;
> >         > });
> >         > }
> >         > void MainLoop::read()
> >         > {
> >         > // TODO: Issue#3 - Need to make calls to the dbus sensor
> >         cache here to
> >         > // ensure the objects all exist?
> >         > /* Host changed state from On to Off */
> >         > if (!isHostOn() && (lastPowerState == HOST_ON ||
> >         > lastPowerState == HOST_NA)) {
> >         > removeHostSensors();
> >         > lastPowerState = HOST_OFF;
> >         > }
> >         > /* Host changed state from Off to On */
> >         > if (isHostOn() && lastPowerState == HOST_OFF) {
> >         > addDroppedHostSensors();
> >         > lastPowerState = HOST_ON;
> >         > }
> >         > When build openBMC I got error:
> >         >
> >
>  tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0:
> >
> >         > error adding symbols: DSO missing from command line
> >         > | collect2: error: ld returned 1 exit status
> >         > | make[2]: *** [Makefile:643: phosphor-hwmon-readd] Error 1
> >         >
> >         > It seems I need adding the threads lib to defend lib.
> >         > Any suggestion to add threads lib to build configuration?
> >         >
> >
> >         That must be because you're using that single boost function?
> >         While you
> >         could add the dependency,
> >         the ideal thing to do since this repo already uses
> >         phosphor-dbus-interfaces is to use the function:
> >
> >                  /** @brief Convert a string to an appropriate enum
> value.
> >                   *  @param[in] s - The string to convert in the form of
> >                   * "xyz.openbmc_project.State.Host.<value name>"
> >                   *  @return - The enum value.
> >                   */
> >                  static HostState convertHostStateFromString(const
> >         std::string& s);
> >
> >         to convert it to the actual HostState enum to check against:
> >
> >                  enum class HostState
> >                  {
> >                      Off,
> >                      Running,
> >                      Quiesced,
> >                      DiagnosticMode,
> >                  };
> >
> >         This is all in xyz/openbmc_project/State/Host/server.hpp
> >         provided by
> >         phosphor-dbus-interfaces.
> >
> >         > Thanks.
> >         > Thu.
> >         >
> >         > On Wed, Oct 21, 2020 at 11:54 PM Thu Ba Nguyen
> >         <tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>
> >         > <mailto:tbnguyen1985@gmail.com
> >         <mailto:tbnguyen1985@gmail.com>>> wrote:
> >         >
> >         >     Hi Vijay,
> >         >
> >         >     I took a look on entity-manager and openbmc source.
> >         >     Don't have many companies  using entity-manager model to
> >         support
> >         >     sensors.
> >         >
> >         >     Regards
> >         >     Thu Nguyen.
> >         >
> >         >
> >         >     On Wed, Oct 21, 2020 at 7:15 AM Vijay Khemka
> >         <vijaykhemka@fb.com <mailto:vijaykhemka@fb.com>
> >         >     <mailto:vijaykhemka@fb.com <mailto:vijaykhemka@fb.com>>>
> >         wrote:
> >         >
> >         >         *From: *openbmc
> >         >         <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org
> >         <mailto:fb.com@lists.ozlabs.org>
> >         >         <mailto:fb.com@lists.ozlabs.org
> >         <mailto:fb.com@lists.ozlabs.org>>> on behalf of Thu Ba Nguyen
> >         >         <tbnguyen1985@gmail.com
> >         <mailto:tbnguyen1985@gmail.com> <mailto:tbnguyen1985@gmail.com
> >         <mailto:tbnguyen1985@gmail.com>>>
> >         >         *Date: *Monday, October 19, 2020 at 11:23 AM
> >         >         *To: *Ed Tanous <ed@tanous.net
> >         <mailto:ed@tanous.net> <mailto:ed@tanous.net
> >         <mailto:ed@tanous.net>>>
> >         >         *Cc: *OpenBMC Maillist <openbmc@lists.ozlabs.org
> >         <mailto:openbmc@lists.ozlabs.org>
> >         >         <mailto:openbmc@lists.ozlabs.org
> >         <mailto:openbmc@lists.ozlabs.org>>>
> >         >         *Subject: *Re: Enable/Disable some sensors when Host
> >         On/Off
> >         >
> >         >         Hi Ed Tanous,
> >         >
> >         >         > Thanks for your info,
> >         >
> >         >         > But in your platform we are using phosphor-hwmon
> >         to manage
> >         >         sensors.
> >         >
> >         >         > We don't use entity-manager.
> >         >
> >         >         > As I knew we can't use both entity-manager and
> >         >         phosphor-hwmon for one project.
> >         >
> >         >         You can use both but for different sensors. You can
> >         decide
> >         >         what sensors to configure
> >         >
> >         >         via EM/dbus-sensors and which one for phosphor-hwmon.
> >         >
> >         >         Regards
> >         >
> >         >         Thu Nguyen.
> >         >
> >
>
>

--00000000000039b26905b34f5bab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Please=C2=A0see my comments below.</=
div><div><br></div><div>Thanks.</div><div>Thu Nguyen.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 4, 2020 =
at 11:31 PM Matt Spinler &lt;<a href=3D"mailto:mspinler@linux.ibm.com">mspi=
nler@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><br>
<br>
On 11/4/2020 3:15 AM, Thu Ba Nguyen wrote:<br>
&gt; Hi=C2=A0Matt, I implemented &quot;Inactive the host sensors&quot; in p=
hosphor-hwmon <br>
&gt; use below...<br>
&gt; This Message Is From an External Sender<br>
&gt; This message came from outside your organization.<br>
&gt;<br>
&gt; Hi=C2=A0Matt,<br>
&gt;<br>
&gt; I implemented &quot;Inactive the host sensors&quot; in phosphor-hwmon =
use below <br>
&gt; approaching:<br>
&gt; 1. Add one option in Sensors configuration, phosphor-hwmon will parse =
<br>
&gt; this option and add host sensors to _hostSensors list.<br>
&gt; 2. In mainloop::read() before going to loop to read the sensors in the=
 <br>
&gt; reading list. Query dbus to get CurrentHostState property.<br>
&gt; This property belongs to service &quot;xyz.openbmc_project.State.Host&=
quot;.<br>
&gt; Based on the status of this property, identify host status.<br>
&gt; If the host is off, remove the host sensors from _state list and dbus.=
 <br>
&gt; I expected the users wouldn&#39;t see the host sensors on the BMC Web =
when <br>
&gt; the host is off.<br>
&gt; If the host is on, add the host sensors back to _state list and also d=
bus.<br>
&gt;<br>
&gt; The code is working. But I have two issues with this approaching:<br>
&gt;<br>
&gt; 1. Too many transactions to get dbus property CurrentHostState.<br>
&gt; In my case, I have 6 services to monitor=C2=A0the sensors which concer=
n the <br>
&gt; host.<br>
&gt; With the current interval 1 second of phosphor-hwmon, I have 6 <br>
&gt; transactions to get CurrentHostState per seconds.<br>
<br>
The better way to implement this would be to read CurrentHostState once <br=
>
on startup, and then register for<br>
propertiesChanged signals for it and provide a callback to update an <br>
internal host state variable.<br></blockquote><div>[Thu] Yes, This is what =
I&#39;m planning to do. But don&#39;t know how to add a propertiesChanged s=
ignals</div><div>to the current phosphor-hwmon framework.</div><div><br></d=
iv><div>I usually use below code to add a signal to dbus.</div><div><div>=
=C2=A0 =C2=A0 boost::asio::io_service io;</div><div>=C2=A0 =C2=A0 ampere::h=
ost::conn =3D</div><div>=C2=A0 =C2=A0 =C2=A0 std::make_shared&lt;sdbusplus:=
:asio::connection&gt;(ampere::host::io);</div><div><br></div><div>=C2=A0 =
=C2=A0 std::vector&lt;std::unique_ptr&lt;sdbusplus::bus::match::match&gt;&g=
t; matches;</div><div>=C2=A0 =C2=A0 //Start tracking power state</div><div>=
=C2=A0 =C2=A0 std::unique_ptr&lt;sdbusplus::bus::match::match&gt; hostMonit=
or =3D</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 ampere::host::startHostStateMo=
nitor();</div><div>=C2=A0 =C2=A0 matches.emplace_back(std::move(hostMonitor=
));</div><div><br></div><div>=C2=A0 =C2=A0 /* wait for the signal */</div><=
div>=C2=A0 =C2=A0 ampere::host::io.run();</div></div><div>But when start io=
.run(), phosphor-hwmon will stop reading sensors.</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-=
width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);paddin=
g-left:1ex">
&gt; 2. When I call &quot;ipmitool power off&quot; the host, there is a gap=
 between <br>
&gt; the time I trigger GPIO to power off the chassis and the time Dbus <br=
>
&gt; property CurrentHostState is updated.<br>
&gt; In this gap, the phosphor-hwmon is still reading sensors. And this <br=
>
&gt; causes the threshold=C2=A0warnings or errors. I want to avoid this.<br=
>
&gt;<br>
&gt; Do you have any suggestions to avoid these issues?<br>
&gt;<br>
<br>
I can&#39;t think of anything at the moment.=C2=A0 Maybe someone else has a=
n idea <br>
here.<br>
<br>
&gt; Others question:<br>
&gt; I saw that phosphor-hwmon is registering an event to smbus and trigger=
 <br>
&gt; the event after each 1 second to read sensors.<br>
&gt; Can I change the phosphor-hwmon code to integrate=C2=A0one dbus signal=
 event?<br>
&gt; Which will be triggered when there is changing in dbus property.<br>
<br>
I&#39;m not sure I understand what you&#39;re asking for here.=C2=A0 Right =
now it <br>
will do 1 second reads (the period is<br>
configurable) and send a properties changed signal for each sensor on <br>
D-Bus only when the value changes.<br></blockquote><div>[Thu] I&#39;m askin=
g for how to add a signal to current phosphor-hwmon framework as comment 1.=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(20=
4,204,204);padding-left:1ex">
&gt;<br>
&gt; I knew how to create a service which adds the call back function when =
<br>
&gt; there is change in dbus property.<br>
&gt; But don&#39;t know how to intergrace it to hwmon.<br>
&gt;<br>
&gt; Regards.<br>
&gt; Thu Nguyen.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Fri, Oct 23, 2020 at 5:45 AM Thu Ba Nguyen &lt;<a href=3D"mailto:tb=
nguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank"=
>tbnguyen1985@gmail.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Just remove all of added code, rebase the phosphor-=
hwmon source to<br>
&gt;=C2=A0 =C2=A0 =C2=A0commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;5906173 (12 months ago) Brad Bishop: build: a=
dd support for<br>
&gt;=C2=A0 =C2=A0 =C2=A0building with meson&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Add the include:<br>
&gt;=C2=A0 =C2=A0 =C2=A0#include&lt;sdbusplus/asio/connection.hpp&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I can see the error<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-nativ=
e/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi=
/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:<br>
&gt;=C2=A0 =C2=A0 =C2=A0phosphor_hwmon_readd-readd.o: undefined reference t=
o symbol<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;pthread_key_delete@@GLIBC_2.4&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-nativ=
e/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi=
/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:<br>
&gt;=C2=A0 =C2=A0 =C2=A0/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/l=
ibpthread.so.0:<br>
&gt;=C2=A0 =C2=A0 =C2=A0error adding symbols: DSO missing from command line=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0| collect2: error: ld returned 1 exit status<br>
&gt;=C2=A0 =C2=A0 =C2=A0| make[2]: *** [Makefile:643: phosphor-hwmon-readd]=
 Error 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0| make[2]: Leaving directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;/openbmc/jade_build/tmp/work/arm1176jzs-openbm=
c-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0| make[1]: *** [Makefile:801: all-recursive] Error =
1<br>
&gt;=C2=A0 =C2=A0 =C2=A0| make[1]: Leaving directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;/openbmc/jade_build/tmp/work/arm1176jzs-openbm=
c-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0| make: *** [Makefile:524: all] Error 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0| ERROR: oe_runmake failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0| WARNING: exit code 1 from a shell command.<br>
&gt;=C2=A0 =C2=A0 =C2=A0| ERROR: Execution of<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;/openbmc/jade_build/tmp/work/arm1176jzs-openbm=
c-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/temp/run.do_com=
pile.2045&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0failed with exit code 1:<br>
&gt;=C2=A0 =C2=A0 =C2=A0| Makefile:800: target &#39;check-valgrind-recursiv=
e&#39; given more than<br>
&gt;=C2=A0 =C2=A0 =C2=A0once in the same rule<br>
&gt;=C2=A0 =C2=A0 =C2=A0| Makefile:800: target &#39;check-valgrind-memcheck=
-recursive&#39; given<br>
&gt;=C2=A0 =C2=A0 =C2=A0more than once in the same rule<br>
&gt;=C2=A0 =C2=A0 =C2=A0| Makefile:800: target &#39;check-valgrind-helgrind=
-recursive&#39; given<br>
&gt;=C2=A0 =C2=A0 =C2=A0more than once in the same rule<br>
&gt;=C2=A0 =C2=A0 =C2=A0| Makefile:800: target &#39;check-valgrind-drd-recu=
rsive&#39; given more<br>
&gt;=C2=A0 =C2=A0 =C2=A0than once in the same rule<br>
&gt;=C2=A0 =C2=A0 =C2=A0| Makefile:800: target &#39;check-valgrind-sgcheck-=
recursive&#39; given<br>
&gt;=C2=A0 =C2=A0 =C2=A0more than once in the same rule<br>
&gt;=C2=A0 =C2=A0 =C2=A0| make =C2=A0all-recursive<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I think we should add thread lib.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thu Nguyen.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Thu, Oct 22, 2020 at 10:51 PM Matt Spinler<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:mspinler@linux.ibm.com" targe=
t=3D"_blank">mspinler@linux.ibm.com</a> &lt;mailto:<a href=3D"mailto:mspinl=
er@linux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a>&gt;&gt; wrot=
e:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 10/22/2020 9:49 AM, Thu Ba Nguyen =
wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I started on supporting enable/d=
isable host sensors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Everythings is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; fine until=C2=A0I...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This Message Is From an External=
 Sender<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; This message came from outside y=
our organization.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I started on supporting enable/d=
isable host sensors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Everythings is fine until=C2=A0I=
 add code to monitor host status<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0as below.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; bool MainLoop::isHostOn(void)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; char buff[128];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if (!powerMatch)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; log&lt;level::ERR&gt;(&quot;Powe=
r Match Not Created&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; sprintf(buff, &quot;isHostOn pow=
erStatusOn: %d\n&quot;,powerStatusOn);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; log&lt;level::INFO&gt;(buff);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; return powerStatusOn;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; std::shared_ptr&lt;sdbusplus::bu=
s::match::match&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; MainLoop::startHostStateMonitor(=
void) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; return std::make_shared&lt;sdbus=
plus::bus::match::match&gt;(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; *conn,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &quot;type=3D&#39;signal&#39;,in=
terface=3D&#39;org.freedesktop.DBus.Properties&#39;,&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;member=3D&#39;PropertiesChanged=
&#39;,arg0=3D&#39;xyz.openbmc_project.State.Host&#39;&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; [](sdbusplus::message::message &=
amp;msg) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; std::string interfaceName;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; boost::container::flat_map&lt;st=
d::string,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::variant&lt;std::string&gt;&gt;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; propertiesChanged;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; try {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; msg.read(interfaceName, properti=
esChanged);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; } catch (std::exception &amp;e) =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; log&lt;level::ERR&gt;(&quot;Unab=
le to read host state\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; // We only want to check for Cur=
rentHostState<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if (propertiesChanged.begin()-&g=
t;first !=3D &quot;CurrentHostState&quot;) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; auto findState =3D propertiesCha=
nged.find(powProperty);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if (findState !=3D propertiesCha=
nged.end())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; powerStatusOn =3D boost::ends_wi=
th(<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; std::get&lt;std::string&gt;(find=
State-&gt;second), &quot;Running&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; powerMatch =3D true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; });<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; void MainLoop::read()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; // TODO: Issue#3 - Need to make =
calls to the dbus sensor<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cache here to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; // ensure the objects all exist?=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /* Host changed state from On to=
 Off */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if (!isHostOn() &amp;&amp; (last=
PowerState =3D=3D HOST_ON ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; lastPowerState =3D=3D HOST_NA)) =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; removeHostSensors();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; lastPowerState =3D HOST_OFF;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; /* Host changed state from Off t=
o On */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; if (isHostOn() &amp;&amp; lastPo=
werState =3D=3D HOST_OFF) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; addDroppedHostSensors();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; lastPowerState =3D HOST_ON;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; When build openBMC I got error:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp/work/arm1176jzs-openbmc-linux-gnu=
eabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthr=
ead.so.0:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; error adding symbols: DSO missin=
g from command line<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; | collect2: error: ld returned 1=
 exit status<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; | make[2]: *** [Makefile:643: ph=
osphor-hwmon-readd] Error 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; It seems I need adding the threa=
ds lib to defend lib.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any suggestion to add threads li=
b to build configuration?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0That must be because you&#39;re using=
 that single boost function?=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0While you<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0could add the dependency,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the ideal thing to do since this repo=
 already uses<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phosphor-dbus-interfaces is to use th=
e function:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /** @brief Convert a string to an appropriate enum value.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *=C2=A0 @param[in] s - The string to convert in the form=
 of<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 * &quot;xyz.openbmc_project.State.Host.&lt;value name&gt=
;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *=C2=A0 @return - The enum value.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 static HostState convertHostStateFromString(const<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0std::string&amp; s);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to convert it to the actual HostState=
 enum to check against:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 enum class HostState<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Off,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Running,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Quiesced,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DiagnosticMode,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is all in xyz/openbmc_project/St=
ate/Host/server.hpp<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0provided by<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phosphor-dbus-interfaces.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thu.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Wed, Oct 21, 2020 at 11:54 PM=
 Thu Ba Nguyen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:tbnguyen1985@gm=
ail.com" target=3D"_blank">tbnguyen1985@gmail.com</a> &lt;mailto:<a href=3D=
"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:tbn=
guyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tbnguyen=
1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt;&gt;&gt; wr=
ote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi Vijay,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I took a look=
 on entity-manager=C2=A0and openbmc source.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Don&#39;t hav=
e=C2=A0many companies =C2=A0using entity-manager model to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0sensors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Thu Nguyen.<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0On Wed, Oct 2=
1, 2020 at 7:15 AM Vijay Khemka<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:vijaykhemka@fb.=
com" target=3D"_blank">vijaykhemka@fb.com</a> &lt;mailto:<a href=3D"mailto:=
vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a=
 href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a=
> &lt;mailto:<a href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijayk=
hemka@fb.com</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*From: *openbmc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&lt;openbmc-bounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.=
org" target=3D"_blank">fb.com@lists.ozlabs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:fb.com@l=
ists.ozlabs.org" target=3D"_blank">fb.com@lists.ozlabs.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&lt;mailto:<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_blank">=
fb.com@lists.ozlabs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:fb.com@l=
ists.ozlabs.org" target=3D"_blank">fb.com@lists.ozlabs.org</a>&gt;&gt;&gt; =
on behalf of Thu Ba Nguyen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&lt;<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen=
1985@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tbnguyen=
1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt; &lt;mailto=
:<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@g=
mail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tbnguyen=
1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a>&gt;&gt;&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*Date: *Monday, October 19, 2020 at 11:23 AM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*To: *Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank">e=
d@tanous.net</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ed@tanou=
s.net" target=3D"_blank">ed@tanous.net</a>&gt; &lt;mailto:<a href=3D"mailto=
:ed@tanous.net" target=3D"_blank">ed@tanous.net</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:ed@tanou=
s.net" target=3D"_blank">ed@tanous.net</a>&gt;&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*Cc: *OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org" t=
arget=3D"_blank">openbmc@lists.ozlabs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openbmc@=
lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&lt;mailto:<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank"=
>openbmc@lists.ozlabs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openbmc@=
lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;&gt;&gt=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*Subject: *Re: Enable/Disable some sensors when Host<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On/Off<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Hi Ed Tanous,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; Thanks for your info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; But in your platform we are using phosphor-hwmon<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to manage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0sensors.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; We don&#39;t use entity-manager.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&gt; As I knew we can&#39;t use both entity-manager and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0phosphor-hwmon for one project.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0You can use both but for different sensors. You can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0decide<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0what sensors to configure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0via EM/dbus-sensors and which one for phosphor-hwmon.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Thu Nguyen.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
<br>
</blockquote></div></div></div>

--00000000000039b26905b34f5bab--
