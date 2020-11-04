Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE7B2A6066
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 10:17:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR1J32FjCzDqXg
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 20:17:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j4RlcgSb; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR1Gx68tHzDq5n
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 20:16:08 +1100 (AEDT)
Received: by mail-qk1-x735.google.com with SMTP id a65so16219157qkg.13
 for <openbmc@lists.ozlabs.org>; Wed, 04 Nov 2020 01:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X5rEXLgIeITGdgirSqqIcITLNkxkh34XLMJxL+bJQNA=;
 b=j4RlcgSbdeLdvb1SJgbTeCPm1xkV+E1chXahNFIghT8FKqCwSDyveF+IC5Fl1r03bT
 BXIL+PjWzC6xs5jsBhp8WVHnskFo7VfdhO3VuZ6nGIBzFdWXtYSsXJFVZqDwYjMW6QWl
 erPyTi79762k7kGbIkH4w7w6ItvPZX+vMn9gPJUrgyr1QlscUD+ariuQzU44VmampxA8
 DWJKO04t4Dmd+HVFZghFlQpiu6RaKh/dFQC11350RSNURJcsAd75RBmLEU+QAHCR2cEO
 d8fiNa/aYCEVgIeCD9BouTkKH8lphm21HkW6uQ3HjJJwwNwJSWCbPiXWdC27d8ahM1fM
 I11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5rEXLgIeITGdgirSqqIcITLNkxkh34XLMJxL+bJQNA=;
 b=m+hWNaE9OVtN8oHWb6J6J9dCm7unAxVSQZM4zn3uooAooIidjJwk1CK5Sr9FOWO1Fe
 GKjHK8G6mK9TSLYwZwk6Z4laM3ps4tXnL2eSP9PS9CysndCJ2hlyeI6ogP+qua3Z7apR
 JTYJMla877FVXtaN7qbz5JEjo/zDvK6y9+RnTmBNOKuxdc19L4+KrE9Ia2jFMi/xePUi
 ZCtAMFayYAIBjMwzQrq+kUgyhtQrqQZ88aojMbCQRqlNJokx+hS78rsSFMfzd8VUi1OT
 U0ZjcF23cx7UISpbr+B/+GhNFvmR+GBiPXDmYDosPy4ZvAAS10OQZf+WoXR2TZ/5CaZ/
 8R7g==
X-Gm-Message-State: AOAM531cI4HAPncawwX37IkDFiOLmVEiu+DQv6cwSGSAv+PEpp3Sfqwe
 2L1acP+K7vA4YaZeDrmoJp/3ot+LmQA1cur1XBs=
X-Google-Smtp-Source: ABdhPJzwm/RvgkOGg6j6gPIZLCd5nmADqr02CSX73jiLxAw8pK+7abmZDoZODFYMDAOoLQeoa0vVDgdcUfYub83GB7M=
X-Received: by 2002:a37:a00c:: with SMTP id j12mr25214694qke.231.1604481364281; 
 Wed, 04 Nov 2020 01:16:04 -0800 (PST)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
 <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
 <90950FB3-E1B3-4ACE-97C5-CB9582A94456@fb.com>
 <CALioo37b-BjgUdfZz2Vm+=6K6VMYRO9auyuHHo7=AZBFpoBzdw@mail.gmail.com>
 <CALioo37LBToJaMs9Zt4q4WcMYKT_rF9zG1ujxv3q8HOQvsE8-w@mail.gmail.com>
 <26b02688-a8c8-3fb3-6cc9-50daabf4d01e@linux.ibm.com>
 <CALioo34WDkK6nVY0+rjKKObcpYVW5JmAZ7sitmXNHP-MM7zhAQ@mail.gmail.com>
In-Reply-To: <CALioo34WDkK6nVY0+rjKKObcpYVW5JmAZ7sitmXNHP-MM7zhAQ@mail.gmail.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Wed, 4 Nov 2020 16:15:53 +0700
Message-ID: <CALioo35QFf6n64pAJm8iiUNzas6-jtf9Xu8hDHmhLQGLSwXpDg@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000c44ce305b3446d20"
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

--000000000000c44ce305b3446d20
Content-Type: text/plain; charset="UTF-8"

Hi Matt,

I implemented "Inactive the host sensors" in phosphor-hwmon use below
approaching:
1. Add one option in Sensors configuration, phosphor-hwmon will parse this
option and add host sensors to _hostSensors list.
2. In mainloop::read() before going to loop to read the sensors in the
reading list. Query dbus to get CurrentHostState property.
This property belongs to service "xyz.openbmc_project.State.Host".
Based on the status of this property, identify host status.
If the host is off, remove the host sensors from _state list and dbus. I
expected the users wouldn't see the host sensors on the BMC Web when the
host is off.
If the host is on, add the host sensors back to _state list and also dbus.

The code is working. But I have two issues with this approaching:

1. Too many transactions to get dbus property CurrentHostState.
In my case, I have 6 services to monitor the sensors which concern the host.
With the current interval 1 second of phosphor-hwmon, I have 6 transactions
to get CurrentHostState per seconds.
2. When I call "ipmitool power off" the host, there is a gap between the
time I trigger GPIO to power off the chassis and the time Dbus property
CurrentHostState is updated.
In this gap, the phosphor-hwmon is still reading sensors. And this causes
the threshold warnings or errors. I want to avoid this.

Do you have any suggestions to avoid these issues?

Others question:
I saw that phosphor-hwmon is registering an event to smbus and trigger the
event after each 1 second to read sensors.
Can I change the phosphor-hwmon code to integrate one dbus signal event?
Which will be triggered when there is changing in dbus property.

I knew how to create a service which adds the call back function when there
is change in dbus property.
But don't know how to intergrace it to hwmon.

Regards.
Thu Nguyen.



On Fri, Oct 23, 2020 at 5:45 AM Thu Ba Nguyen <tbnguyen1985@gmail.com>
wrote:

> Just remove all of added code, rebase the phosphor-hwmon source to commit
> "5906173 (12 months ago) Brad Bishop: build: add support for building with
> meson"
>
> Add the include:
> #include <sdbusplus/asio/connection.hpp>
> I can see the error
> |
> /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:
> phosphor_hwmon_readd-readd.o: undefined reference to symbol
> 'pthread_key_delete@@GLIBC_2.4'
> |
> /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbmc-linux-gnueabi/10.1.0/ld:
> /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0:
> error adding symbols: DSO missing from command line
> | collect2: error: ld returned 1 exit status
> | make[2]: *** [Makefile:643: phosphor-hwmon-readd] Error 1
> | make[2]: Leaving directory
> '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build'
> | make[1]: *** [Makefile:801: all-recursive] Error 1
> | make[1]: Leaving directory
> '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/build'
> | make: *** [Makefile:524: all] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Execution of
> '/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/temp/run.do_compile.2045'
> failed with exit code 1:
> | Makefile:800: target 'check-valgrind-recursive' given more than once in
> the same rule
> | Makefile:800: target 'check-valgrind-memcheck-recursive' given more than
> once in the same rule
> | Makefile:800: target 'check-valgrind-helgrind-recursive' given more than
> once in the same rule
> | Makefile:800: target 'check-valgrind-drd-recursive' given more than once
> in the same rule
> | Makefile:800: target 'check-valgrind-sgcheck-recursive' given more than
> once in the same rule
> | make  all-recursive
>
> I think we should add thread lib.
>
> Regards.
> Thu Nguyen.
>
>
> On Thu, Oct 22, 2020 at 10:51 PM Matt Spinler <mspinler@linux.ibm.com>
> wrote:
>
>>
>>
>> On 10/22/2020 9:49 AM, Thu Ba Nguyen wrote:
>> > I started on supporting enable/disable host sensors. Everythings is
>> > fine until I...
>> > This Message Is From an External Sender
>> > This message came from outside your organization.
>> >
>> > I started on supporting enable/disable host sensors.
>> > Everythings is fine until I add code to monitor host status as below.
>> > bool MainLoop::isHostOn(void)
>> > {
>> > char buff[128];
>> > if (!powerMatch)
>> > {
>> > log<level::ERR>("Power Match Not Created");
>> > }
>> > sprintf(buff, "isHostOn powerStatusOn: %d\n",powerStatusOn);
>> > log<level::INFO>(buff);
>> > return powerStatusOn;
>> > }
>> > std::shared_ptr<sdbusplus::bus::match::match>
>> > MainLoop::startHostStateMonitor(void) {
>> > return std::make_shared<sdbusplus::bus::match::match>(
>> > *conn,
>> > "type='signal',interface='org.freedesktop.DBus.Properties',"
>> > "member='PropertiesChanged',arg0='xyz.openbmc_project.State.Host'",
>> > [](sdbusplus::message::message &msg) {
>> > std::string interfaceName;
>> > boost::container::flat_map<std::string, std::variant<std::string>>
>> > propertiesChanged;
>> > try {
>> > msg.read(interfaceName, propertiesChanged);
>> > } catch (std::exception &e) {
>> > log<level::ERR>("Unable to read host state\n");
>> > return;
>> > }
>> > // We only want to check for CurrentHostState
>> > if (propertiesChanged.begin()->first != "CurrentHostState") {
>> > return;
>> > }
>> > auto findState = propertiesChanged.find(powProperty);
>> > if (findState != propertiesChanged.end())
>> > {
>> > powerStatusOn = boost::ends_with(
>> > std::get<std::string>(findState->second), "Running");
>> > }
>> > powerMatch = true;
>> > });
>> > }
>> > void MainLoop::read()
>> > {
>> > // TODO: Issue#3 - Need to make calls to the dbus sensor cache here to
>> > // ensure the objects all exist?
>> > /* Host changed state from On to Off */
>> > if (!isHostOn() && (lastPowerState == HOST_ON ||
>> > lastPowerState == HOST_NA)) {
>> > removeHostSensors();
>> > lastPowerState = HOST_OFF;
>> > }
>> > /* Host changed state from Off to On */
>> > if (isHostOn() && lastPowerState == HOST_OFF) {
>> > addDroppedHostSensors();
>> > lastPowerState = HOST_ON;
>> > }
>> > When build openBMC I got error:
>> >
>> tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0:
>>
>> > error adding symbols: DSO missing from command line
>> > | collect2: error: ld returned 1 exit status
>> > | make[2]: *** [Makefile:643: phosphor-hwmon-readd] Error 1
>> >
>> > It seems I need adding the threads lib to defend lib.
>> > Any suggestion to add threads lib to build configuration?
>> >
>>
>> That must be because you're using that single boost function?  While you
>> could add the dependency,
>> the ideal thing to do since this repo already uses
>> phosphor-dbus-interfaces is to use the function:
>>
>>          /** @brief Convert a string to an appropriate enum value.
>>           *  @param[in] s - The string to convert in the form of
>>           *                 "xyz.openbmc_project.State.Host.<value name>"
>>           *  @return - The enum value.
>>           */
>>          static HostState convertHostStateFromString(const std::string&
>> s);
>>
>> to convert it to the actual HostState enum to check against:
>>
>>          enum class HostState
>>          {
>>              Off,
>>              Running,
>>              Quiesced,
>>              DiagnosticMode,
>>          };
>>
>> This is all in xyz/openbmc_project/State/Host/server.hpp provided by
>> phosphor-dbus-interfaces.
>>
>> > Thanks.
>> > Thu.
>> >
>> > On Wed, Oct 21, 2020 at 11:54 PM Thu Ba Nguyen <tbnguyen1985@gmail.com
>> > <mailto:tbnguyen1985@gmail.com>> wrote:
>> >
>> >     Hi Vijay,
>> >
>> >     I took a look on entity-manager and openbmc source.
>> >     Don't have many companies  using entity-manager model to support
>> >     sensors.
>> >
>> >     Regards
>> >     Thu Nguyen.
>> >
>> >
>> >     On Wed, Oct 21, 2020 at 7:15 AM Vijay Khemka <vijaykhemka@fb.com
>> >     <mailto:vijaykhemka@fb.com>> wrote:
>> >
>> >         *From: *openbmc
>> >         <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org
>> >         <mailto:fb.com@lists.ozlabs.org>> on behalf of Thu Ba Nguyen
>> >         <tbnguyen1985@gmail.com <mailto:tbnguyen1985@gmail.com>>
>> >         *Date: *Monday, October 19, 2020 at 11:23 AM
>> >         *To: *Ed Tanous <ed@tanous.net <mailto:ed@tanous.net>>
>> >         *Cc: *OpenBMC Maillist <openbmc@lists.ozlabs.org
>> >         <mailto:openbmc@lists.ozlabs.org>>
>> >         *Subject: *Re: Enable/Disable some sensors when Host On/Off
>> >
>> >         Hi Ed Tanous,
>> >
>> >         > Thanks for your info,
>> >
>> >         > But in your platform we are using phosphor-hwmon to manage
>> >         sensors.
>> >
>> >         > We don't use entity-manager.
>> >
>> >         > As I knew we can't use both entity-manager and
>> >         phosphor-hwmon for one project.
>> >
>> >         You can use both but for different sensors. You can decide
>> >         what sensors to configure
>> >
>> >         via EM/dbus-sensors and which one for phosphor-hwmon.
>> >
>> >         Regards
>> >
>> >         Thu Nguyen.
>> >
>>
>>

--000000000000c44ce305b3446d20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Matt,<div><br></=
div><div>I implemented &quot;Inactive the host sensors&quot; in phosphor-hw=
mon use below approaching:</div><div>1. Add one option in Sensors configura=
tion, phosphor-hwmon will parse this option and add host sensors to _hostSe=
nsors list.</div><div>2. In mainloop::read() before going to loop to read t=
he sensors in the reading list. Query dbus to get CurrentHostState property=
.</div><div>This property belongs to service &quot;xyz.openbmc_project.Stat=
e.Host&quot;.</div><div>Based on the status of this property, identify host=
 status.</div><div>If the host is off, remove the host sensors from _state =
list and dbus. I expected the users wouldn&#39;t see the host sensors on th=
e BMC Web when the host is off.</div><div>If the host is on, add the host s=
ensors back to _state list and also dbus.</div><div><br></div><div>The code=
 is working. But I have two issues with this approaching:</div><div><br></d=
iv><div>1. Too many transactions to get dbus property CurrentHostState.</di=
v><div>In my case, I have 6 services to monitor=C2=A0the sensors which conc=
ern the host.</div><div>With the current interval 1 second of phosphor-hwmo=
n, I have 6 transactions to get CurrentHostState per seconds.</div><div>2. =
When I call &quot;ipmitool power off&quot; the host, there is a gap between=
 the time I trigger GPIO to power off the chassis and the time Dbus propert=
y CurrentHostState is updated.</div><div>In this gap, the phosphor-hwmon is=
 still reading sensors. And this causes the threshold=C2=A0warnings or erro=
rs. I want to avoid this.</div><div><br></div><div>Do you have any suggesti=
ons to avoid these issues?</div><div><br></div><div>Others question:</div><=
div>I saw that phosphor-hwmon is registering an event to smbus and trigger =
the event after each 1 second to read sensors.</div><div>Can I change the p=
hosphor-hwmon code to integrate=C2=A0one dbus signal event?</div><div>Which=
 will be triggered when there is changing in dbus property.</div><div><br><=
/div><div>I knew how to create a service which adds the call back function =
when there is change in dbus property.</div><div>But don&#39;t know how to =
intergrace it to hwmon.</div><div><br></div><div>Regards.</div><div>Thu Ngu=
yen.</div><div><br></div><div><br></div></div></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 23, 2020 at=
 5:45 AM Thu Ba Nguyen &lt;<a href=3D"mailto:tbnguyen1985@gmail.com">tbnguy=
en1985@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;border-left-color:rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Just remove all of =
added code, rebase the phosphor-hwmon source to commit=C2=A0</div><div>&quo=
t;5906173 (12 months ago) Brad Bishop: build: add support for building with=
 meson&quot;</div><div><br></div><div>Add the include:</div><div><span styl=
e=3D"font-family:Menlo,Monaco,&quot;Courier New&quot;,monospace;font-size:1=
8px;white-space:pre-wrap;background-color:rgb(30,30,30);color:rgb(197,134,1=
92)">#include</span><span style=3D"font-family:Menlo,Monaco,&quot;Courier N=
ew&quot;,monospace;font-size:18px;white-space:pre-wrap;background-color:rgb=
(30,30,30);color:rgb(86,156,214)"> </span><span style=3D"font-family:Menlo,=
Monaco,&quot;Courier New&quot;,monospace;font-size:18px;white-space:pre-wra=
p;background-color:rgb(30,30,30);color:rgb(206,145,120)">&lt;sdbusplus/asio=
/connection.hpp&gt;</span><br></div><div>I can see the error=C2=A0</div><di=
v><div>| /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phos=
phor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-native/usr/bin/arm-o=
penbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc/arm-openbm=
c-linux-gnueabi/10.1.0/ld: phosphor_hwmon_readd-readd.<span style=3D"backgr=
ound-color:rgb(255,0,0)">o</span><span style=3D"background-color:rgb(255,0,=
0)">: undefined reference to symbol &#39;pthread_key_delete@@GLIBC_2.4&#39;=
</span></div><div>| /openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-g=
nueabi/phosphor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot-native/us=
r/bin/arm-openbmc-linux-gnueabi/../../libexec/arm-openbmc-linux-gnueabi/gcc=
/arm-openbmc-linux-gnueabi/10.1.0/ld: /openbmc/jade_build/tmp/work/arm1176j=
zs-openbmc-linux-gnueabi<span style=3D"background-color:rgb(255,0,0)">/phos=
phor-hwmon/1.0+gitAUTOINC+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0:=
 error adding symbols: DSO missing from command line</span></div><div>| col=
lect2: error: ld returned 1 exit status</div><div>| make[2]: *** [Makefile:=
643: phosphor-hwmon-readd] Error 1</div><div>| make[2]: Leaving directory &=
#39;/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-=
hwmon/1.0+gitAUTOINC+5906173aec-r1/build&#39;</div><div>| make[1]: *** [Mak=
efile:801: all-recursive] Error 1</div><div>| make[1]: Leaving directory &#=
39;/openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-h=
wmon/1.0+gitAUTOINC+5906173aec-r1/build&#39;</div><div>| make: *** [Makefil=
e:524: all] Error 2</div><div>| ERROR: oe_runmake failed</div><div>| WARNIN=
G: exit code 1 from a shell command.</div><div>| ERROR: Execution of &#39;/=
openbmc/jade_build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon=
/1.0+gitAUTOINC+5906173aec-r1/temp/run.do_compile.2045&#39; failed with exi=
t code 1:</div><div>| Makefile:800: target &#39;check-valgrind-recursive&#3=
9; given more than once in the same rule</div><div>| Makefile:800: target &=
#39;check-valgrind-memcheck-recursive&#39; given more than once in the same=
 rule</div><div>| Makefile:800: target &#39;check-valgrind-helgrind-recursi=
ve&#39; given more than once in the same rule</div><div>| Makefile:800: tar=
get &#39;check-valgrind-drd-recursive&#39; given more than once in the same=
 rule</div><div>| Makefile:800: target &#39;check-valgrind-sgcheck-recursiv=
e&#39; given more than once in the same rule</div><div>| make =C2=A0all-rec=
ursive</div></div><div><br></div><div>I think we should add thread lib.</di=
v><div><br></div><div>Regards.</div><div>Thu Nguyen.</div><div dir=3D"ltr">=
</div><div dir=3D"ltr"><span style=3D"font-family:Menlo,Monaco,&quot;Courie=
r New&quot;,monospace;font-size:18px;white-space:pre-wrap;background-color:=
rgb(30,30,30);color:rgb(206,145,120)"><br></span></div></div></div></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Oct 22, 2020 at 10:51 PM Matt Spinler &lt;<a href=3D"mailto:mspinler@=
linux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,2=
04);padding-left:1ex"><br>
<br>
On 10/22/2020 9:49 AM, Thu Ba Nguyen wrote:<br>
&gt; I started on supporting enable/disable host sensors. Everythings is <b=
r>
&gt; fine until=C2=A0I...<br>
&gt; This Message Is From an External Sender<br>
&gt; This message came from outside your organization.<br>
&gt;<br>
&gt; I started on supporting enable/disable host sensors.<br>
&gt; Everythings is fine until=C2=A0I add code to monitor host status as be=
low.<br>
&gt; bool MainLoop::isHostOn(void)<br>
&gt; {<br>
&gt; char buff[128];<br>
&gt; if (!powerMatch)<br>
&gt; {<br>
&gt; log&lt;level::ERR&gt;(&quot;Power Match Not Created&quot;);<br>
&gt; }<br>
&gt; sprintf(buff, &quot;isHostOn powerStatusOn: %d\n&quot;,powerStatusOn);=
<br>
&gt; log&lt;level::INFO&gt;(buff);<br>
&gt; return powerStatusOn;<br>
&gt; }<br>
&gt; std::shared_ptr&lt;sdbusplus::bus::match::match&gt;<br>
&gt; MainLoop::startHostStateMonitor(void) {<br>
&gt; return std::make_shared&lt;sdbusplus::bus::match::match&gt;(<br>
&gt; *conn,<br>
&gt; &quot;type=3D&#39;signal&#39;,interface=3D&#39;org.freedesktop.DBus.Pr=
operties&#39;,&quot;<br>
&gt; &quot;member=3D&#39;PropertiesChanged&#39;,arg0=3D&#39;xyz.openbmc_pro=
ject.State.Host&#39;&quot;,<br>
&gt; [](sdbusplus::message::message &amp;msg) {<br>
&gt; std::string interfaceName;<br>
&gt; boost::container::flat_map&lt;std::string, std::variant&lt;std::string=
&gt;&gt;<br>
&gt; propertiesChanged;<br>
&gt; try {<br>
&gt; msg.read(interfaceName, propertiesChanged);<br>
&gt; } catch (std::exception &amp;e) {<br>
&gt; log&lt;level::ERR&gt;(&quot;Unable to read host state\n&quot;);<br>
&gt; return;<br>
&gt; }<br>
&gt; // We only want to check for CurrentHostState<br>
&gt; if (propertiesChanged.begin()-&gt;first !=3D &quot;CurrentHostState&qu=
ot;) {<br>
&gt; return;<br>
&gt; }<br>
&gt; auto findState =3D propertiesChanged.find(powProperty);<br>
&gt; if (findState !=3D propertiesChanged.end())<br>
&gt; {<br>
&gt; powerStatusOn =3D boost::ends_with(<br>
&gt; std::get&lt;std::string&gt;(findState-&gt;second), &quot;Running&quot;=
);<br>
&gt; }<br>
&gt; powerMatch =3D true;<br>
&gt; });<br>
&gt; }<br>
&gt; void MainLoop::read()<br>
&gt; {<br>
&gt; // TODO: Issue#3 - Need to make calls to the dbus sensor cache here to=
<br>
&gt; // ensure the objects all exist?<br>
&gt; /* Host changed state from On to Off */<br>
&gt; if (!isHostOn() &amp;&amp; (lastPowerState =3D=3D HOST_ON ||<br>
&gt; lastPowerState =3D=3D HOST_NA)) {<br>
&gt; removeHostSensors();<br>
&gt; lastPowerState =3D HOST_OFF;<br>
&gt; }<br>
&gt; /* Host changed state from Off to On */<br>
&gt; if (isHostOn() &amp;&amp; lastPowerState =3D=3D HOST_OFF) {<br>
&gt; addDroppedHostSensors();<br>
&gt; lastPowerState =3D HOST_ON;<br>
&gt; }<br>
&gt; When build openBMC I got error:<br>
&gt; tmp/work/arm1176jzs-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOIN=
C+5906173aec-r1/recipe-sysroot/lib/libpthread.so.0: <br>
&gt; error adding symbols: DSO missing from command line<br>
&gt; | collect2: error: ld returned 1 exit status<br>
&gt; | make[2]: *** [Makefile:643: phosphor-hwmon-readd] Error 1<br>
&gt;<br>
&gt; It seems I need adding the threads lib to defend lib.<br>
&gt; Any suggestion to add threads lib to build configuration?<br>
&gt;<br>
<br>
That must be because you&#39;re using that single boost function?=C2=A0 Whi=
le you <br>
could add the dependency,<br>
the ideal thing to do since this repo already uses <br>
phosphor-dbus-interfaces is to use the function:<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /** @brief Convert a strin=
g to an appropriate enum value.<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 @param[in] s=
 - The string to convert in the form of<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;xyz.openbmc_project.State.Host.&lt;value name&gt;&quot;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 @return - Th=
e enum value.<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static HostState convertHo=
stStateFromString(const std::string&amp; s);<br>
<br>
to convert it to the actual HostState enum to check against:<br>
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum class HostState<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Of=
f,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ru=
nning,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Qu=
iesced,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Di=
agnosticMode,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>
<br>
This is all in xyz/openbmc_project/State/Host/server.hpp provided by <br>
phosphor-dbus-interfaces.<br>
<br>
&gt; Thanks.<br>
&gt; Thu.<br>
&gt;<br>
&gt; On Wed, Oct 21, 2020 at 11:54 PM Thu Ba Nguyen &lt;<a href=3D"mailto:t=
bnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank"=
>tbnguyen1985@gmail.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Vijay,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I took a look on entity-manager=C2=A0and openbmc so=
urce.<br>
&gt;=C2=A0 =C2=A0 =C2=A0Don&#39;t have=C2=A0many companies =C2=A0using enti=
ty-manager model to support<br>
&gt;=C2=A0 =C2=A0 =C2=A0sensors.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thu Nguyen.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed, Oct 21, 2020 at 7:15 AM Vijay Khemka &lt;<a=
 href=3D"mailto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vijaykhemka@fb.com" ta=
rget=3D"_blank">vijaykhemka@fb.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*From: *openbmc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;openbmc-bounces+vijaykhemka=3D<a =
href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_blank">fb.com@lists.ozla=
bs.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:fb.com@l=
ists.ozlabs.org" target=3D"_blank">fb.com@lists.ozlabs.org</a>&gt;&gt; on b=
ehalf of Thu Ba Nguyen<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:tbnguyen1985@gm=
ail.com" target=3D"_blank">tbnguyen1985@gmail.com</a> &lt;mailto:<a href=3D=
"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.com</a=
>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*Date: *Monday, October 19, 2020 at 1=
1:23 AM<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*To: *Ed Tanous &lt;<a href=3D"mailto=
:ed@tanous.net" target=3D"_blank">ed@tanous.net</a> &lt;mailto:<a href=3D"m=
ailto:ed@tanous.net" target=3D"_blank">ed@tanous.net</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*Cc: *OpenBMC Maillist &lt;<a href=3D=
"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.or=
g</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openbmc@=
lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;&gt;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*Subject: *Re: Enable/Disable some se=
nsors when Host On/Off<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Ed Tanous,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks for your info,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; But in your platform we are usin=
g phosphor-hwmon to manage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sensors.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; We don&#39;t use entity-manager.=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; As I knew we can&#39;t use both =
entity-manager and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0phosphor-hwmon for one project.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You can use both but for different se=
nsors. You can decide<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0what sensors to configure<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0via EM/dbus-sensors and which one for=
 phosphor-hwmon.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Regards<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thu Nguyen.<br>
&gt;<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000c44ce305b3446d20--
