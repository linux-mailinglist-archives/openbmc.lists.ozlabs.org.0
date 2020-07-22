Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82831228D35
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 02:50:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBH1K2NdwzDqgd
	for <lists+openbmc@lfdr.de>; Wed, 22 Jul 2020 10:49:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=varunsampat@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C2oBwTDf; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBH0D40YJzDqJq
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jul 2020 10:48:58 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id g13so635958qtv.8
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jul 2020 17:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vEVPVY2GPHa09RB3OzxN4WDIDi2QS/N7WiDxOvDqklI=;
 b=C2oBwTDfDELVeHO0t0iLhxWNTsFaFeJnK+FCjwvWcypzBnesFzCGXfrGWzWmnMiVJU
 08puwMiD3mXYSbAsVbPjj/+5pjKetPB/3cnbD55A+Jo8RCGxDny1Se1q+OCMrwhVTmy6
 aKxvgXXSbJyLddN/xvk6J/2MeuL4Xg//Mrx2Vv7y2urNkCctTx+aHi2ZoQZuHw8A9fKF
 orGExxZycWU7FrhDqOvVpsIt1iMwynws50XxtQVYVlZS4h988pGUF64BKdV1FGcbBDlR
 wfhNyzVbcoEbcxTlCM0+NSEzMXxpu4rDU1UiLD6EdhoKeiHXCNQtOkNuxQ2XkqjMAEOY
 TEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vEVPVY2GPHa09RB3OzxN4WDIDi2QS/N7WiDxOvDqklI=;
 b=GpBoNBgdAm2gEXHnKpc4FrxuznkZxpj+TwgVBozkvy5/TcsGnv2DtjBEpkY5jyluOt
 /b7sWEfHAFNLvPfZ5yD6thptJFtitihFM3M+Jw5IhBwP1NtAIGs2aojLsXUQm8dIv0cR
 8bg1qQCd/CIL2xaZNIRVLp203Sm5t/21yHONIE0cDwaBy/FmBEyC/Ku2V+Skg3ToSMta
 QtYoVV7i6PXCtZeebV9ijS89PnOU5TKinWEvEwarCtV5Hm+ZSyxkpUc+Rc2yHd5t9V6w
 iVg6xLx+dho6J2L2Fk+nxoD8DmTNhBubIkHRu4YhV+c/OalIgHEbbYmcrnebbhPohuYx
 wnsg==
X-Gm-Message-State: AOAM532xaGEXI2nWWBdmc7Zjd0TC8z3r/LQrLIQ2ZygwZozfvH5C6UA8
 D01ts0PzTkOTNaMctirxoXndc6lkP/od077xdA8=
X-Google-Smtp-Source: ABdhPJw3fPqkdfSdhBukuioDj7vPtWnOGHvZlP4flYPPziw+ZU6mdsyvr+wnUCZ1GJ2EcKUFQ/Oxq+4DhkPZxBq7/Ls=
X-Received: by 2002:aed:2199:: with SMTP id l25mr31312192qtc.309.1595378934606; 
 Tue, 21 Jul 2020 17:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <b0f8f9e05d6041cd87474866b8dc70dc@SCL-EXCHMB-13.phoenix.com>
 <CAGK=0VCiUp=obiP-f1QZdcYooUah9jjxcFR+mMv+xkZAVNYV6Q@mail.gmail.com>
 <e9df6d243ef04897991bad8001ca0ff8@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <e9df6d243ef04897991bad8001ca0ff8@SCL-EXCHMB-13.phoenix.com>
From: Varun Sampat <varunsampat@gmail.com>
Date: Tue, 21 Jul 2020 17:48:43 -0700
Message-ID: <CAGK=0VA85GzvtxbGOe__pdfMrg1MKZqPK-rtCAOCdPdo3y=tLg@mail.gmail.com>
Subject: Re: Discrete sensors for host error monitor signals
To: Patrick Voelker <Patrick_Voelker@phoenix.com>
Content-Type: multipart/alternative; boundary="000000000000adf12905aafd1a0f"
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
Cc: "OpenBMC \(openbmc@lists.ozlabs.org\)" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000adf12905aafd1a0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patrick

Regarding you question about assigning 'event type' to the sensor, this is
how we have implemented it:

1. You are right about the 'getSensorEventTypeFromPath()' currently being
hardcoded to "threshold". The way we have implemented this is that in the
getSensorEventTypeFromPath() function, instead of returning 0x01 (or
threshold) as it is now, we only return 0x01 for threshold based sensor
types (such as 0x01, 0x02, 0x03, 0x04 or other 0x0b). For everything else
we return 0x6f. We use 6f as the event type for all discrete events. We
don't distinguish the event type on discrete sensors such as "digital
discrete" or "generic discrete"

2. For the discrete sensors, we create an sdr record for 'Type 3"
Event-only sensors in the phosphor-ipmi-host recipe in the
sensorhandler.hpp file where the full sdr record is currently defined. We
create one for Type 3 events only sensors based on the IPMI spec
description in section 43.3.

3. Now in the sensorcommands.cpp file (in intel-ipmi-oem), in the
ipmiStorageGetSDR function we check the getSensorEventTypeFromPath() and if
it is of type "discrete" as defined in step 1, we populate the fields based
on the type 3 record defined in step 2 and return success.

For creating a value property, you can register_property for 'Value' when
you create the sensor object and interface like I described in step 3 of my
previous email. Off the top of my head, I am not sure how to assert and
de-assert based on changes to the 'value' of discrete sensors (at least
that's my interpretation of what you're trying to do, please correct me if
I'm wrong) so I can't be of much help there. In our case we just use the
IpmiSelAdd method-call to assert or de-assert directly in our event handler
like I described in steps 6 and 7 of my previous email.

Hope that helps.

-Varun

On Mon, Jul 20, 2020 at 11:56 AM Patrick Voelker <
Patrick_Voelker@phoenix.com> wrote:

> Varun, thanks so much for your response.
>
>
>
> I see that I can add to SensorTypeCodes in
> intel-ipmi-oem/include/sdrutils.hpp and that it will be used to match
> against the dbus sensor path.  How though do you recommend assigning the
> sensor event type to the sensor?  getSensorEventTypeFromPath() is current=
ly
> hardcoded to =E2=80=9Cthreshold=E2=80=9D and I don=E2=80=99t see how I co=
uld determine it from the
> sensor path (the way they are currently implemented.)
>
>
>
> I=E2=80=99d like my new sensors to be readable so I=E2=80=99m planning on=
 adding a
> "xyz.openbmc_project.Sensor.Value=E2=80=9D interface.  Also, I=E2=80=99d =
like
> phosphor-sel-logger to be able to match on changes to be able to
> automatically generate events so that I don=E2=80=99t need to embed IPMI =
specific
> information into the dbus-sensors module.  I think I need a dbus interfac=
e
> akin to "xyz.openbmc_project.Sensor.Threshold.Warning" that would instead
> be my assertion and deassertion event masks.  Do these interfaces and
> properties look reasonable?
>
>
>
> xyz.openbmc_project.Sensor.Discrete.Assertion
>
> .AssertionAlarmMask
>
> xyz.openbmc_project.Sensor.Discrete.Deassertion
>
> .DeassertionAlarmMask
>
>
>
> As always, if I=E2=80=99m re-inventing the wheel here and there=E2=80=99s=
 an example that
> already exists that I can follow, please point me in the right direction.
>
>
>
>
>
> *From:* Varun Sampat [mailto:varunsampat@gmail.com]
> *Sent:* Friday, July 17, 2020 10:11 AM
> *To:* Patrick Voelker
> *Cc:* OpenBMC (openbmc@lists.ozlabs.org)
> *Subject:* Re: Discrete sensors for host error monitor signals
>
>
>
> Hi Patrick
>
>
>
> Though we don't use host-error-monitor at Twitter, we do have a number of
> discrete sensors implemented. I can provide some details that can hopeful=
ly
> help get you started.
>
>
>
> I should mention though, the below steps are only applicable if you're
> using 'dbus-sensors' for your sensors and the phosphor-sel-logger.
>
>
>
> 1. Include the 'intel-ipmi-oem' recipe in your package
>
>
>
> 2. In the 'intel-ipmi-oem' recipe, in the file called sdrutils.hpp, you
> will find a bunch of enumerated entries for different (threshold based)
> sensor types such as voltage, current etc. You can add discrete sensor ty=
pe
> you want here, for example for CATERRs it probably would be of the type
> "processor" (0x07)
>
>
>
> 3. You don't  necessarily need to add the discrete sensor to
> entity-manager (you can if you like). Instead, under dbu-sensors you need
> to create a service and add an interface for your sensor. We have
> implemented by adding code in dbus-sensors that has a list of event-only
> sensors and our code loops through and adds all of them. However to start
> out, you can just do it for a single discrete sensor by doing the followi=
ng:
>
> a. create a file (say processorerror.cpp) along the same lines as one of
> the existing sensor types
>
> b. request a service name using "request->name"
>
> c. register your object path and interface
>
> The above file would essentially do nothing other than just create a dbus
> sensor.
>
>
>
> 4. Create entries in the CMakeLists.txt file in dbus-sensors to build you=
r
> .cpp file and make sure it corresponds with the sensor type you created i=
n
> intel-ipmi-oem in step 2.
>
>
>
> 5. Once the above step is done, if you build an image, you should see the
> sensor you created (say something like
> "/xyz/openbmc_project/sensors/processor/Processor_Error" ) if you do
> "ipmitool sdr elist all". The sensor will be created with a dynamically
> assigned sensor number just like all the threshold based sensors. However=
,
> instead of displaying a value like it would for a threshold sensor it wil=
l
> say "Event-Only". At this point your discrete sensor is created but doesn=
't
> really do anything
>
>
>
> 6. Now, in order to generate a SEL, we use the IpmiSelAdd method that is
> present in the sel-logger service:
>
> # busctl introspect  xyz.openbmc_project.Logging.IPMI
> /xyz/openbmc_project/Logging/IPMI
>
> NAME                                TYPE      SIGNATURE RESULT/VALUE FLAG=
S
>
> *org.freedesktop.DBus.Introspectable* interface -         -            -
>
> .Introspect                         method    -         s            -
>
> *org.freedesktop.DBus.Peer          * interface -         -            -
>
> .GetMachineId                       method    -         s            -
>
> .Ping                               method    -         -            -
>
> *org.freedesktop.DBus.Properties    * interface -         -            -
>
> .Get                                method    ss        v            -
>
> .GetAll                             method    s         a{sv}        -
>
> .Set                                method    ssv       -            -
>
> .PropertiesChanged                  signal    sa{sv}as  -            -
>
> *xyz.openbmc_project.Logging.IPMI   * interface -         -            -
>
> .IpmiSelAdd                         method    ssaybq    q            -
>
> .IpmiSelAddOem                      method    sayy      q            -
>
>
>
> As you can see above, the IpmiSelAdd method takes 6 arguments, 'ssaybq' a=
s
> described in
> https://dbus.freedesktop.org/doc/dbus-specification.html#type-system.
> <https://dbus.freedesktop.org/doc/dbus-specification.html#type-system>
>
> Looking at the code in phosphor-sel-logger where the IpmiSelAdd method is
> registered, we can see what the ssaybq arguments correspond to:
>
> ifaceAddSel->register_method(
>
>         "IpmiSelAdd", [](const std::string &message, const std::string
> &path,
>
>                          const std::vector<uint8_t> &selData,
>
>                          const bool &assert, const uint16_t &genId) {
>
>
>
> Based on this, we can directly call the method using busctl to test if a
> SEL is created for the discrete sensor. For example, for the sensor we
> created in step 5, we could do the following to generate a SEL:
>
> busctl call xyz.openbmc_project.Logging.IPMI
> /xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI
> IpmiSelAdd ssaybq <message string> <sensor object path, i.e
> "/xyz/openbmc_project/sensors/processor/Processor_Error">  <number of byt=
es
> in the event data vector, which in this case would be 3>  <event data
> vector>  < assert/de-assert yes/no>  <generator id, 0x0020 for bmc>
>
>
>
> (the first 4 arguments after 'call' are the service, object, interface an=
d
> the method)
>
>
>
> To give you an example, here is what the above command looks like for a
> discrete sensor for a power button press:
>
> Command:
>
> # busctl call xyz.openbmc_project.Logging.IPMI
> /xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI
> IpmiSelAdd ssaybq "SEL Entry"
> "/xyz/openbmc_project/sensors/pwr_button/POWER_BUTTON" 3 {0x00,0x01,0x00}
> yes 0x20
>
>
>
> Sel generated:
>
> f | 07/17/20 | 16:49:01 UTC | Button POWER BUTTON | Power Button pressed =
|
> Asserted
>
>
>
> 7. If you have a service that triggers on an event, you could directly
> call the above command to generate a SEL in your service file. For exampl=
e,
> we have a gpio service that triggers on certain events and we directly ca=
ll
> the above command from the service file. In other cases we call a method =
to
> generate the SEL in code in the event "handler" function. This might be
> more relevant for our host-error-monitor case. Here is an example from ou=
r
> code for how we call the IpmiSelAdd method:
>
> sdbusplus::message::message writeSEL =3D conn->new_method_call(
>
>             ipmiSelService, ipmiSelPath, ipmiSelAddInterface, "IpmiSelAdd=
"
> );
>
>         writeSEL.append(ipmiSelAddMessage, dbusPath, eventData, assert,
> genId);
>
>
>
>         try
>
>         {
>
>             conn->call(writeSEL);
>
>         }
>
>
>
> Here, conn is the "shared_ptr". The other arguments are pretty much the
> same as described in the busctl command in #6.  Not sure how this would
> work with host-error-monitor but you can try it with the relevant
> shared_ptr in host_error_monitor.cpp and it might possibly work.
>
>
>
> Hope this helps.
>
>
>
> -Varun
>
>
>
>
>
> On Tue, Jul 14, 2020 at 3:07 PM Patrick Voelker <
> Patrick_Voelker@phoenix.com> wrote:
>
> Hi, I=E2=80=99d like to log IPMI SEL events for changes in the signals mo=
nitored
> by OpenBMC/host-error-monitor.  I don=E2=80=99t have much experience with=
 OpenBMC=E2=80=99s
> sensors yet so I=E2=80=99m not sure what the best approach is and am look=
ing for
> some guidance.
>
>
>
> I haven=E2=80=99t found a good example yet of a IPMI discrete sensor and =
I don=E2=80=99t
> want to put IPMI specific information into host-error-monitor to directly
> add SEL events via phosphor-sel-logger.
>
>
>
> Here=E2=80=99s my understanding thus far :
>
>
>
> * A module needs to instantiate dbus sensors representing the signals
> being monitored.  This could be done in host-error-monitor or duplicate
> some of the functionality in dbus-sensors.  Is there a benefit to extendi=
ng
> one over the other?
>
>
>
> * One or more IPMI SDRs should be created for the IPMI sensors needed to
> group all the necessary discrete offsets.  If I=E2=80=99m using entity-ma=
nager in
> my build, is that where I would define this sensor?  If not, is there som=
e
> other way to accomplish this?
>
>
>
> * phosphor-sel-logger then needs to monitor (match) dbus discrete sensor
> property changes to create appropriate IPMI and redfish logs for the even=
ts
> as they occur.
>
>
>
> Does that sound about right? Thanks in advance for your help.
>
>

--000000000000adf12905aafd1a0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:times new roman,serif">Hi Patrick</div><div class=3D"gmail_default=
" style=3D"font-family:times new roman,serif"><br></div><div class=3D"gmail=
_default" style=3D"font-family:times new roman,serif">Regarding you questio=
n about assigning &#39;event type&#39; to the sensor, this is how we have i=
mplemented it:</div><div class=3D"gmail_default" style=3D"font-family:times=
 new roman,serif"><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:times new roman,serif">1. You are right about the &#39;getSensorEventTyp=
eFromPath()&#39; currently being hardcoded to &quot;threshold&quot;. The wa=
y we have implemented this is that in the getSensorEventTypeFromPath() func=
tion, instead of returning 0x01 (or threshold) as it is now, we only return=
 0x01 for threshold based sensor types (such as 0x01, 0x02, 0x03, 0x04 or o=
ther 0x0b). For everything else we return 0x6f. We use 6f as the event type=
 for all discrete events. We don&#39;t distinguish the event type on discre=
te sensors such as &quot;digital discrete&quot; or &quot;generic discrete&q=
uot;</div><div class=3D"gmail_default" style=3D"font-family:times new roman=
,serif"><br></div><div class=3D"gmail_default" style=3D"font-family:times n=
ew roman,serif">2. For the discrete sensors, we create an sdr record for &#=
39;Type 3&quot; Event-only sensors in the phosphor-ipmi-host recipe in the =
sensorhandler.hpp file where the full sdr record is currently defined. We c=
reate one for Type 3 events only sensors based on the IPMI spec description=
 in section 43.3.<br></div><div class=3D"gmail_default" style=3D"font-famil=
y:times new roman,serif"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:times new roman,serif">3. Now in the sensorcommands.cpp file (in =
intel-ipmi-oem), in the ipmiStorageGetSDR function we check the getSensorEv=
entTypeFromPath() and if it is of type &quot;discrete&quot; as defined in s=
tep 1, we populate the fields based on the type 3 record defined in step 2 =
and return success. <br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:times new roman,serif"><br></div><div class=3D"gmail_default" style=3D=
"font-family:times new roman,serif">For creating a value property, you can =
register_property for &#39;Value&#39; when you create the sensor object and=
 interface like I described in step 3 of my previous email. Off the top of =
my head, I am not sure how to assert and de-assert based on changes to the =
&#39;value&#39; of discrete sensors (at least that&#39;s my interpretation =
of what you&#39;re trying to do, please correct me if I&#39;m wrong) so I c=
an&#39;t be of much help there. In our case we just use the IpmiSelAdd meth=
od-call to assert or de-assert directly in our event handler like I describ=
ed in steps 6 and 7 of my previous email.</div><div class=3D"gmail_default"=
 style=3D"font-family:times new roman,serif"><br></div><div class=3D"gmail_=
default" style=3D"font-family:times new roman,serif">Hope that helps.</div>=
<div class=3D"gmail_default" style=3D"font-family:times new roman,serif"><b=
r></div><div class=3D"gmail_default" style=3D"font-family:times new roman,s=
erif">-Varun<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Jul 20, 2020 at 11:56 AM Patrick Voelker &lt;=
<a href=3D"mailto:Patrick_Voelker@phoenix.com" target=3D"_blank">Patrick_Vo=
elker@phoenix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">Varun, thanks so muc=
h for your response.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=C2=A0<u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">I see that I can add=
 to SensorTypeCodes in intel-ipmi-oem/include/sdrutils.hpp and that it will=
 be used to match against the dbus sensor path.=C2=A0 How though do
 you recommend assigning the sensor event type to the sensor?=C2=A0 getSens=
orEventTypeFromPath() is currently hardcoded to =E2=80=9Cthreshold=E2=80=9D=
 and I don=E2=80=99t see how I could determine it from the sensor path (the=
 way they are currently implemented.)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=C2=A0<u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">I=E2=80=99d like my =
new sensors to be readable so I=E2=80=99m planning on adding a &quot;xyz.op=
enbmc_project.Sensor.Value=E2=80=9D interface.=C2=A0 Also, I=E2=80=99d like=
 phosphor-sel-logger to be able
 to match on changes to be able to automatically generate events so that I =
don=E2=80=99t need to embed IPMI specific information into the dbus-sensors=
 module.=C2=A0 I think I need a dbus interface akin to &quot;xyz.openbmc_pr=
oject.Sensor.Threshold.Warning&quot; that would instead
 be my assertion and deassertion event masks.=C2=A0 Do these interfaces and=
 properties look reasonable?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=C2=A0<u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">xyz.openbmc_project.=
Sensor.Discrete.Assertion<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">.AssertionAlarmMask<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">xyz.openbmc_project.=
Sensor.Discrete.Deassertion<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">.DeassertionAlarmMas=
k<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=C2=A0<u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)">As always, if I=E2=
=80=99m re-inventing the wheel here and there=E2=80=99s an example that alr=
eady exists that I can follow, please point me in the right direction.<u></=
u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:&quot;Cali=
bri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=C2=A0<u></u>=
</span></p>
<p class=3D"MsoNormal"><a name=3D"m_-6347551391788688739_m_-223794530622912=
7611__MailEndCompose"><span style=3D"font-size:11pt;font-family:&quot;Calib=
ri&quot;,&quot;sans-serif&quot;;color:rgb(31,73,125)"><u></u>=C2=A0<u></u><=
/span></a></p>
<div style=3D"border-color:currentcolor currentcolor currentcolor blue;bord=
er-style:none none none solid;border-width:medium medium medium 1.5pt;paddi=
ng:0in 0in 0in 4pt">
<div>
<div style=3D"border-color:rgb(181,196,223) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10pt;font-family:&quot;T=
ahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-siz=
e:10pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Varun Sampat=
 [mailto:<a href=3D"mailto:varunsampat@gmail.com" target=3D"_blank">varunsa=
mpat@gmail.com</a>]
<br>
<b>Sent:</b> Friday, July 17, 2020 10:11 AM<br>
<b>To:</b> Patrick Voelker<br>
<b>Cc:</b> OpenBMC (<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_=
blank">openbmc@lists.ozlabs.org</a>)<br>
<b>Subject:</b> Re: Discrete sensors for host error monitor signals<u></u><=
u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Patrick<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Though we don&#39;t use host-error-monitor at Twitte=
r, we do have a number of discrete sensors implemented. I can provide some =
details that can hopefully help get you started.
<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I should mention though, the below steps are only ap=
plicable if you&#39;re using &#39;dbus-sensors&#39; for your sensors and th=
e phosphor-sel-logger.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">1. Include the &#39;intel-ipmi-oem&#39; recipe in yo=
ur package<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">2. In the &#39;intel-ipmi-oem&#39; recipe, in the fi=
le called sdrutils.hpp, you will find a bunch of enumerated entries for dif=
ferent (threshold based) sensor types such as voltage, current etc. You can=
 add discrete sensor type you want here, for
 example for CATERRs it probably would be of the type &quot;processor&quot;=
 (0x07)<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">3. You don&#39;t=C2=A0 necessarily need to add the d=
iscrete sensor to entity-manager (you can if you like). Instead, under dbu-=
sensors you need to create a service and add an interface for your sensor. =
We have implemented by adding code in dbus-sensors
 that has a list of event-only sensors and our code loops through and adds =
all of them. However to start out, you can just do it for a single discrete=
 sensor by doing the following:<u></u><u></u></p>
</div>
<div style=3D"margin-left:30pt">
<p class=3D"MsoNormal">a. create a file (say processorerror.cpp) along the =
same lines as one of the existing sensor types<u></u><u></u></p>
</div>
<div style=3D"margin-left:30pt">
<p class=3D"MsoNormal">b. request a service name using &quot;request-&gt;na=
me&quot;<u></u><u></u></p>
</div>
<div style=3D"margin-left:30pt">
<p class=3D"MsoNormal">c. register your object path and interface <u></u><u=
></u></p>
</div>
<div>
<p class=3D"MsoNormal">The above file would essentially do nothing other th=
an just create a dbus sensor.<u></u><u></u></p>
</div>
<div style=3D"margin-left:30pt">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">4. Create entries in the CMakeLists.txt file in dbus=
-sensors to build your .cpp file and make sure it corresponds with the sens=
or type you created in intel-ipmi-oem in step 2.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">5. Once the above step is done, if you build an imag=
e, you should see the sensor you created (say something like &quot;/xyz/ope=
nbmc_project/sensors/processor/Processor_Error&quot; ) if you do &quot;ipmi=
tool sdr elist all&quot;. The sensor will be created with
 a dynamically assigned sensor number just like all the threshold based sen=
sors. However, instead of displaying a value like it would for a threshold =
sensor it will say &quot;Event-Only&quot;. At this point your discrete sens=
or is created but doesn&#39;t really do anything<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">6. Now, in order to generate a SEL, we use the IpmiS=
elAdd method that is present in the sel-logger service:<u></u><u></u></p>
</div>
<div>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%"># bus=
ctl introspect=C2=A0 xyz.openbmc_project.Logging.IPMI /xyz/openbmc_project/=
Logging/IPMI</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&q=
uot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">NAME=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TYPE=C2=A0 =C2=A0 =C2=A0 SIGNATURE R=
ESULT/VALUE FLAGS</span><span style=3D"font-size:8.5pt;font-family:&quot;Me=
nlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<b><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif=
&quot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">or=
g.freedesktop.DBus.Introspectable</span></b><span style=3D"font-size:8.5pt;=
font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(=
238,238,238) none repeat scroll 0% 0%"> interface - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 -</span><span style=3D"font-size:8.5pt;font-family:&quot;Men=
lo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">.Intr=
ospect =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 method=C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -</span><span style=3D"font-size:8.5pt;=
font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u>=
</span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<b><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif=
&quot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">or=
g.freedesktop.DBus.Peer =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></b><span =
style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;co=
lor:black;background:rgb(238,238,238) none repeat scroll 0% 0%"> interface =
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 -</span><span style=3D"font-size:8.5pt;font-family:&quot;Men=
lo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">.GetM=
achineId =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 method=C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -</span><span style=3D"font-size:8.5pt;font-fa=
mily:&quot;Menlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span>=
</p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">.Ping=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method=C2=A0 =C2=A0 - =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -</span><span style=3D"fo=
nt-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black">=
<u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<b><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif=
&quot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">or=
g.freedesktop.DBus.Properties =C2=A0 =C2=A0</span></b><span style=3D"font-s=
ize:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black;backg=
round:rgb(238,238,238) none repeat scroll 0% 0%"> interface - =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 -</span><span style=3D"font-size:8.5pt;font-family:&quot;Men=
lo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">.Get=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method=C2=A0 =C2=A0 ss=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 v=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -</span><span styl=
e=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:=
black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">.GetA=
ll =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 method=C2=A0 =C2=A0 s =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 a{sv}=C2=A0 =C2=A0 =C2=A0 =C2=A0 -</span><span style=3D"font-size:8.5pt=
;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u=
></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">.Set=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 method=C2=A0 =C2=A0 ssv =C2=A0 =C2=
=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -</span><span style=
=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:b=
lack"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">.Prop=
ertiesChanged=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 signal=C2=A0 =C2=A0 sa{sv}as=C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&q=
uot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<b><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif=
&quot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">xy=
z.openbmc_project.Logging.IPMI=C2=A0 =C2=A0</span></b><span style=3D"font-s=
ize:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black;backg=
round:rgb(238,238,238) none repeat scroll 0% 0%"> interface - =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 -=C2=A0 =C2=A0 =C2=A0 =C2=A0
 =C2=A0 =C2=A0 -</span><span style=3D"font-size:8.5pt;font-family:&quot;Men=
lo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">.Ipmi=
SelAdd =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 method=C2=A0 =C2=A0 ssaybq=C2=A0 =C2=A0 q=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -</span><span style=3D"font-size:8.5pt;font-fam=
ily:&quot;Menlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span><=
/p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">.Ipmi=
SelAddOem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 method=C2=A0 =C2=A0 sayy=C2=A0 =C2=A0 =C2=A0 q=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 -</span><span style=3D"font-size:8.5pt;font-family=
:&quot;Menlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">As you can see above, the IpmiSelAdd method takes 6 =
arguments, &#39;ssaybq&#39; as described in
<a href=3D"https://dbus.freedesktop.org/doc/dbus-specification.html#type-sy=
stem" target=3D"_blank">
https://dbus.freedesktop.org/doc/dbus-specification.html#type-system.<br>
</a><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Looking at the code in phosphor-sel-logger where the=
 IpmiSelAdd method is registered, we can see what the ssaybq arguments corr=
espond to:<u></u><u></u></p>
</div>
<div>
<p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-size:8.5pt;font-fa=
mily:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238=
,238) none repeat scroll 0% 0%">ifaceAddSel-&gt;register_method(</span><spa=
n style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;=
color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-size:8.5pt;font-fa=
mily:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238=
,238) none repeat scroll 0% 0%">=C2=A0 =C2=A0 =C2=A0 =C2=A0
</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;s=
erif&quot;;color:rgb(180,36,25);background:rgb(238,238,238) none repeat scr=
oll 0% 0%">&quot;IpmiSelAdd&quot;</span><span style=3D"font-size:8.5pt;font=
-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,=
238,238) none repeat scroll 0% 0%">, [](</span><span style=3D"font-size:8.5=
pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:rgb(47,180,29);bac=
kground:rgb(238,238,238) none repeat scroll 0% 0%">const</span><span style=
=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:b=
lack;background:rgb(238,238,238) none repeat scroll 0% 0%">
 std::string &amp;message, </span><span style=3D"font-size:8.5pt;font-famil=
y:&quot;Menlo&quot;,&quot;serif&quot;;color:rgb(47,180,29);background:rgb(2=
38,238,238) none repeat scroll 0% 0%">const</span><span style=3D"font-size:=
8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black;backgroun=
d:rgb(238,238,238) none repeat scroll 0% 0%"> std::string &amp;path,</span>=
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-size:8.5pt;font-fa=
mily:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238=
,238) none repeat scroll 0% 0%">=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;s=
erif&quot;;color:rgb(47,180,29);background:rgb(238,238,238) none repeat scr=
oll 0% 0%">const</span><span style=3D"font-size:8.5pt;font-family:&quot;Men=
lo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238,238) none rep=
eat scroll 0% 0%"> std::vector&lt;</span><span style=3D"font-size:8.5pt;fon=
t-family:&quot;Menlo&quot;,&quot;serif&quot;;color:rgb(47,180,29);backgroun=
d:rgb(238,238,238) none repeat scroll 0% 0%">uint8_t</span><span style=3D"f=
ont-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black;=
background:rgb(238,238,238) none repeat scroll 0% 0%">&gt;
 &amp;selData,</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo=
&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&=
quot;,&quot;serif&quot;;color:rgb(47,180,29);background:rgb(238,238,238) no=
ne repeat scroll 0% 0%">const</span><span style=3D"font-size:8.5pt;font-fam=
ily:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238,=
238) none repeat scroll 0% 0%">
</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;s=
erif&quot;;color:rgb(47,180,29);background:rgb(238,238,238) none repeat scr=
oll 0% 0%">bool</span><span style=3D"font-size:8.5pt;font-family:&quot;Menl=
o&quot;,&quot;serif&quot;;color:black;background:rgb(238,238,238) none repe=
at scroll 0% 0%"> &amp;assert,
</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;s=
erif&quot;;color:rgb(47,180,29);background:rgb(238,238,238) none repeat scr=
oll 0% 0%">const</span><span style=3D"font-size:8.5pt;font-family:&quot;Men=
lo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238,238) none rep=
eat scroll 0% 0%">
</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;s=
erif&quot;;color:rgb(47,180,29);background:rgb(238,238,238) none repeat scr=
oll 0% 0%">uint16_t</span><span style=3D"font-size:8.5pt;font-family:&quot;=
Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238,238) none =
repeat scroll 0% 0%"> &amp;genId) {</span><span style=3D"font-size:8.5pt;fo=
nt-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></=
span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Based on this, we can directly call the method using=
 busctl to test if a SEL is created for the discrete sensor. For example, f=
or the sensor we created in step 5, we could do the following to generate a=
 SEL:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"background:rgb(238,238,238) none repe=
at scroll 0% 0%">busctl call xyz.openbmc_project.Logging.IPMI /xyz/openbmc_=
project/Logging/IPMI xyz.openbmc_project.Logging.IPMI IpmiSelAdd ssaybq &lt=
;message string&gt; &lt;sensor object path, i.e &quot;/xyz/openbmc_project/=
sensors/processor/Processor_Error&quot;&gt;=C2=A0
 &lt;number of bytes in the event data vector, which in this case would be =
3&gt;=C2=A0 &lt;event data vector&gt;=C2=A0 &lt; assert/de-assert yes/no&gt=
;=C2=A0 &lt;generator id, 0x0020 for bmc&gt;</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"background:white none repeat scroll 0=
% 0%">(the first 4 arguments after &#39;call&#39; are the service, object, =
interface and the method)</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">To give you an example, here is what the above comma=
nd looks like for a discrete sensor for a power button press:<u></u><u></u>=
</p>
</div>
<div>
<p class=3D"MsoNormal">Command:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"background:rgb(238,238,238) none repe=
at scroll 0% 0%"># busctl call xyz.openbmc_project.Logging.IPMI /xyz/openbm=
c_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI IpmiSelAdd ssaybq &=
quot;SEL Entry&quot; &quot;/xyz/openbmc_project/sensors/pwr_button/POWER_BU=
TTON&quot; 3 {0x00,0x01,0x00}
 yes 0x20</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Sel generated:<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"background:rgb(238,238,238) none repe=
at scroll 0% 0%">f | 07/17/20 | 16:49:01 UTC | Button POWER BUTTON | Power =
Button pressed | Asserted</span><u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">7. If you have a service that triggers on an event, =
you could directly call the above command to generate a SEL in your service=
 file. For example, we have a gpio service that triggers on certain events =
and we directly call the above command
 from the service file. In other cases we call a method to generate the SEL=
 in code in the event &quot;handler&quot; function. This might be more rele=
vant for our host-error-monitor case. Here is an example from our code for =
how we call the IpmiSelAdd method:<u></u><u></u></p>
</div>
<div>
<p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-size:8.5pt;font-fa=
mily:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238=
,238) none repeat scroll 0% 0%">sdbusplus::message::message writeSEL =3D co=
nn-&gt;new_method_call(</span><span style=3D"font-size:8.5pt;font-family:&q=
uot;Menlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-size:8.5pt;font-fa=
mily:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238=
,238) none repeat scroll 0% 0%">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
pmiSelService, ipmiSelPath, ipmiSelAddInterface,
</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;s=
erif&quot;;color:rgb(180,36,25);background:rgb(238,238,238) none repeat scr=
oll 0% 0%">&quot;IpmiSelAdd&quot;</span><span style=3D"font-size:8.5pt;font=
-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,=
238,238) none repeat scroll 0% 0%">);</span><span style=3D"font-size:8.5pt;=
font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u>=
</span></p>
<p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-size:8.5pt;font-fa=
mily:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238=
,238) none repeat scroll 0% 0%">=C2=A0 =C2=A0 =C2=A0 =C2=A0 writeSEL.append=
(ipmiSelAddMessage, dbusPath, eventData, assert, genId);</span><span style=
=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:b=
lack"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;min-height:13px"><span style=3D"font-si=
ze:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;color:black"><u></=
u>=C2=A0<u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-size:8.5pt;font-fa=
mily:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238=
,238) none repeat scroll 0% 0%">=C2=A0 =C2=A0 =C2=A0 =C2=A0
</span><span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;s=
erif&quot;;color:rgb(193,101,28);background:rgb(238,238,238) none repeat sc=
roll 0% 0%">try</span><span style=3D"font-size:8.5pt;font-family:&quot;Menl=
o&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-size:8.5pt;font-fa=
mily:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238=
,238) none repeat scroll 0% 0%">=C2=A0 =C2=A0 =C2=A0 =C2=A0 {</span><span s=
tyle=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&quot;;col=
or:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt"><span style=3D"font-size:8.5pt;font-fa=
mily:&quot;Menlo&quot;,&quot;serif&quot;;color:black;background:rgb(238,238=
,238) none repeat scroll 0% 0%">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
onn-&gt;call(writeSEL);</span><span style=3D"font-size:8.5pt;font-family:&q=
uot;Menlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span></p>
<p style=3D"margin:0in 0in 0.0001pt;font-variant-numeric:normal;font-varian=
t-east-asian:normal;font-stretch:normal">
<span style=3D"font-size:8.5pt;font-family:&quot;Menlo&quot;,&quot;serif&qu=
ot;;color:black;background:rgb(238,238,238) none repeat scroll 0% 0%">=C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0}</span><span style=3D"font-size:8.5pt;font-f=
amily:&quot;Menlo&quot;,&quot;serif&quot;;color:black"><u></u><u></u></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Here, conn is the &quot;shared_ptr&quot;. The other =
arguments are pretty much the same as described in the busctl command in #6=
.=C2=A0 Not sure how this would work with host-error-monitor but you can tr=
y it with the relevant shared_ptr in host_error_monitor.cpp
 and it might possibly work.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Hope this helps.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">-Varun <u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, Jul 14, 2020 at 3:07 PM Patrick Voelker &lt;=
<a href=3D"mailto:Patrick_Voelker@phoenix.com" target=3D"_blank">Patrick_Vo=
elker@phoenix.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<div>
<div>
<p class=3D"MsoNormal">Hi, I=E2=80=99d like to log IPMI SEL events for chan=
ges in the signals monitored by OpenBMC/host-error-monitor.=C2=A0 I don=E2=
=80=99t have much experience with OpenBMC=E2=80=99s sensors yet so I=E2=80=
=99m not sure
 what the best approach is and am looking for some guidance.<u></u><u></u><=
/p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">I haven=E2=80=99t found a good example yet of a IPMI=
 discrete sensor and I don=E2=80=99t want to put IPMI specific information =
into host-error-monitor to directly add SEL events via phosphor-sel-logger.=
<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Here=E2=80=99s my understanding thus far :<u></u><u>=
</u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">* A module needs to instantiate dbus sensors represe=
nting the signals being monitored.=C2=A0 This could be done in host-error-m=
onitor or duplicate some of the functionality in dbus-sensors.=C2=A0
 Is there a benefit to extending one over the other?<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">* One or more IPMI SDRs should be created for the IP=
MI sensors needed to group all the necessary discrete offsets.=C2=A0 If I=
=E2=80=99m using entity-manager in my build, is that where I would
 define this sensor?=C2=A0 If not, is there some other way to accomplish th=
is?<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">* phosphor-sel-logger then needs to monitor (match) =
dbus discrete sensor property changes to create appropriate IPMI and redfis=
h logs for the events as they occur.<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Does that sound about right? Thanks in advance for y=
our help.<u></u><u></u></p>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>
</div>

--000000000000adf12905aafd1a0f--
