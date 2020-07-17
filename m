Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3B822418E
	for <lists+openbmc@lfdr.de>; Fri, 17 Jul 2020 19:12:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B7d2j4qGmzDrRV
	for <lists+openbmc@lfdr.de>; Sat, 18 Jul 2020 03:11:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=varunsampat@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NdtXXsOU; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B7d1v6DZRzDrQp
 for <openbmc@lists.ozlabs.org>; Sat, 18 Jul 2020 03:11:12 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id t11so4552741qvk.1
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jul 2020 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uFfOEshC33mJUcXneuTKBJQXzt+4PWkkTqUe/7vY/Og=;
 b=NdtXXsOU2H30ISDXSdA4kj8lHOMsOpxP8OA8kld+J6VedAfidD/Zn9zV0sfU0iPL4P
 o8rV2nLXPuntUaEQzpuhbvLsbWaSR4GNZpWJb/hNSQTSiZx3Hge3bP1SNczFLcqhLf09
 ku2/Al4f5EXaLznmgWcDhztkZKQqlJtjarykH36wPU8fvdG+NtMuoSiOg8zJXbckm9ax
 RvNR/DOEGNr9Bxl1W+huTd67RIaOdj/E2LmNoWvKbpVs/3ZajaCs4ztgRmbVozzmtE8x
 fzPj+fofsqkskdTao7kQNxwflYKbD7aNMwgKMoIvH+qg/O9MBZuciAtpbIjnSyOmp3gj
 iyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uFfOEshC33mJUcXneuTKBJQXzt+4PWkkTqUe/7vY/Og=;
 b=fPWenhY3wABW3fNHC8o04GBHcDJQIN9rFOz5teCD5kN4LEtpD/d1h7rfvwBTVqkZjH
 K+kgXs1wiJCFTtI7ugVifULsDLRKp/H4t54Fu98vwycI8mnW2c8m3xNe9rz7Uoeb93aj
 qVBK9tO7/XT9laqJOrFBUdHy9IcKBbnD88xcxJimH5gOyVp0Q1x8Mtin9y8r5HOfA8Ui
 xRqlfV5dCn89BrwRwM7Ry32ey9FG0IGVQ2NA1JqOV7AwGi3AKFHtIUHU51+0/ng4iLqg
 1Jo8LxpWP3NpFzje0iPwoDskHmpBK488BxmFI/CSl36iSb7dHlfYQhWr85dPJeIGJo29
 iTIw==
X-Gm-Message-State: AOAM532BOnmbmvj8+bjhT87GbfLvKXPy7lUPUpMdwqIWIpbgEGUtjiik
 EIVFy0tmJBM7DeIqeIl6wyrxIRf+3uaJb/TMQGs=
X-Google-Smtp-Source: ABdhPJzgudKmiCtdpatA5GBnvUSBMLNr6Qpb6h1yu7IAQR+qGjX/OqVpFOnVnUVZWT/OLS+WZCaLwpwvbuUHh9lpkQ8=
X-Received: by 2002:a0c:facb:: with SMTP id p11mr9920857qvo.243.1595005868222; 
 Fri, 17 Jul 2020 10:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <b0f8f9e05d6041cd87474866b8dc70dc@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <b0f8f9e05d6041cd87474866b8dc70dc@SCL-EXCHMB-13.phoenix.com>
From: Varun Sampat <varunsampat@gmail.com>
Date: Fri, 17 Jul 2020 10:10:57 -0700
Message-ID: <CAGK=0VCiUp=obiP-f1QZdcYooUah9jjxcFR+mMv+xkZAVNYV6Q@mail.gmail.com>
Subject: Re: Discrete sensors for host error monitor signals
To: Patrick Voelker <Patrick_Voelker@phoenix.com>
Content-Type: multipart/alternative; boundary="00000000000030b1b905aaa63e06"
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

--00000000000030b1b905aaa63e06
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Patrick

Though we don't use host-error-monitor at Twitter, we do have a number of
discrete sensors implemented. I can provide some details that can hopefully
help get you started.

I should mention though, the below steps are only applicable if you're
using 'dbus-sensors' for your sensors and the phosphor-sel-logger.

1. Include the 'intel-ipmi-oem' recipe in your package

2. In the 'intel-ipmi-oem' recipe, in the file called sdrutils.hpp, you
will find a bunch of enumerated entries for different (threshold based)
sensor types such as voltage, current etc. You can add discrete sensor type
you want here, for example for CATERRs it probably would be of the type
"processor" (0x07)

3. You don't  necessarily need to add the discrete sensor to entity-manager
(you can if you like). Instead, under dbu-sensors you need to create a
service and add an interface for your sensor. We have implemented by adding
code in dbus-sensors that has a list of event-only sensors and our code
loops through and adds all of them. However to start out, you can just do
it for a single discrete sensor by doing the following:
a. create a file (say processorerror.cpp) along the same lines as one of
the existing sensor types
b. request a service name using "request->name"
c. register your object path and interface
The above file would essentially do nothing other than just create a dbus
sensor.

4. Create entries in the CMakeLists.txt file in dbus-sensors to build your
.cpp file and make sure it corresponds with the sensor type you created in
intel-ipmi-oem in step 2.

5. Once the above step is done, if you build an image, you should see the
sensor you created (say something like
"/xyz/openbmc_project/sensors/processor/Processor_Error" ) if you do
"ipmitool sdr elist all". The sensor will be created with a dynamically
assigned sensor number just like all the threshold based sensors. However,
instead of displaying a value like it would for a threshold sensor it will
say "Event-Only". At this point your discrete sensor is created but doesn't
really do anything

6. Now, in order to generate a SEL, we use the IpmiSelAdd method that is
present in the sel-logger service:

# busctl introspect  xyz.openbmc_project.Logging.IPMI
/xyz/openbmc_project/Logging/IPMI

NAME                                TYPE      SIGNATURE RESULT/VALUE FLAGS

*org.freedesktop.DBus.Introspectable* interface -         -            -

.Introspect                         method    -         s            -

*org.freedesktop.DBus.Peer          * interface -         -            -

.GetMachineId                       method    -         s            -

.Ping                               method    -         -            -

*org.freedesktop.DBus.Properties    * interface -         -            -

.Get                                method    ss        v            -

.GetAll                             method    s         a{sv}        -

.Set                                method    ssv       -            -

.PropertiesChanged                  signal    sa{sv}as  -            -

*xyz.openbmc_project.Logging.IPMI   * interface -         -            -

.IpmiSelAdd                         method    ssaybq    q            -

.IpmiSelAddOem                      method    sayy      q            -

As you can see above, the IpmiSelAdd method takes 6 arguments, 'ssaybq' as
described in
https://dbus.freedesktop.org/doc/dbus-specification.html#type-system.
<https://dbus.freedesktop.org/doc/dbus-specification.html#type-system>
Looking at the code in phosphor-sel-logger where the IpmiSelAdd method is
registered, we can see what the ssaybq arguments correspond to:

ifaceAddSel->register_method(

        "IpmiSelAdd", [](const std::string &message, const std::string
&path,

                         const std::vector<uint8_t> &selData,

                         const bool &assert, const uint16_t &genId) {

Based on this, we can directly call the method using busctl to test if a
SEL is created for the discrete sensor. For example, for the sensor we
created in step 5, we could do the following to generate a SEL:
busctl call xyz.openbmc_project.Logging.IPMI
/xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI
IpmiSelAdd ssaybq <message string> <sensor object path, i.e
"/xyz/openbmc_project/sensors/processor/Processor_Error">  <number of bytes
in the event data vector, which in this case would be 3>  <event data
vector>  < assert/de-assert yes/no>  <generator id, 0x0020 for bmc>

(the first 4 arguments after 'call' are the service, object, interface and
the method)

To give you an example, here is what the above command looks like for a
discrete sensor for a power button press:
Command:
# busctl call xyz.openbmc_project.Logging.IPMI
/xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI
IpmiSelAdd ssaybq "SEL Entry"
"/xyz/openbmc_project/sensors/pwr_button/POWER_BUTTON" 3 {0x00,0x01,0x00}
yes 0x20

Sel generated:
f | 07/17/20 | 16:49:01 UTC | Button POWER BUTTON | Power Button pressed |
Asserted

7. If you have a service that triggers on an event, you could directly call
the above command to generate a SEL in your service file. For example, we
have a gpio service that triggers on certain events and we directly call
the above command from the service file. In other cases we call a method to
generate the SEL in code in the event "handler" function. This might be
more relevant for our host-error-monitor case. Here is an example from our
code for how we call the IpmiSelAdd method:

sdbusplus::message::message writeSEL =3D conn->new_method_call(

            ipmiSelService, ipmiSelPath, ipmiSelAddInterface, "IpmiSelAdd")=
;

        writeSEL.append(ipmiSelAddMessage, dbusPath, eventData, assert,
genId);


        try

        {

            conn->call(writeSEL);

        }

Here, conn is the "shared_ptr". The other arguments are pretty much the
same as described in the busctl command in #6.  Not sure how this would
work with host-error-monitor but you can try it with the relevant
shared_ptr in host_error_monitor.cpp and it might possibly work.

Hope this helps.

-Varun


On Tue, Jul 14, 2020 at 3:07 PM Patrick Voelker <Patrick_Voelker@phoenix.co=
m>
wrote:

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

--00000000000030b1b905aaa63e06
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:times ne=
w roman,serif">Hi Patrick</div><div class=3D"gmail_default" style=3D"font-f=
amily:times new roman,serif"><br></div><div class=3D"gmail_default" style=
=3D"font-family:times new roman,serif">Though we don&#39;t use host-error-m=
onitor at Twitter, we do have a number of discrete sensors implemented. I c=
an provide some details that can hopefully help get you started. <br></div>=
<div class=3D"gmail_default" style=3D"font-family:times new roman,serif"><b=
r></div><div class=3D"gmail_default" style=3D"font-family:times new roman,s=
erif">I should mention though, the below steps are only applicable if you&#=
39;re using &#39;dbus-sensors&#39; for your sensors and the phosphor-sel-lo=
gger.</div><div class=3D"gmail_default" style=3D"font-family:times new roma=
n,serif"><br></div><div class=3D"gmail_default" style=3D"font-family:times =
new roman,serif">1. Include the &#39;intel-ipmi-oem&#39; recipe in your pac=
kage</div><div class=3D"gmail_default" style=3D"font-family:times new roman=
,serif"><br></div><div class=3D"gmail_default" style=3D"font-family:times n=
ew roman,serif">2. In the &#39;intel-ipmi-oem&#39; recipe, in the file call=
ed sdrutils.hpp, you will find a bunch of enumerated entries for different =
(threshold based) sensor types such as voltage, current etc. You can add di=
screte sensor type you want here, for example for CATERRs it probably would=
 be of the type &quot;processor&quot; (0x07)</div><div class=3D"gmail_defau=
lt" style=3D"font-family:times new roman,serif"><br></div><div class=3D"gma=
il_default" style=3D"font-family:times new roman,serif">3. You don&#39;t=C2=
=A0 necessarily need to add the discrete sensor to entity-manager (you can =
if you like). Instead, under dbu-sensors you need to create a service and a=
dd an interface for your sensor. We have implemented by adding code in dbus=
-sensors that has a list of event-only sensors and our code loops through a=
nd adds all of them. However to start out, you can just do it for a single =
discrete sensor by doing the following:<br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:times new roman,serif;margin-left:40px">a. create a=
 file (say processorerror.cpp) along the same lines as one of the existing =
sensor types</div><div class=3D"gmail_default" style=3D"font-family:times n=
ew roman,serif;margin-left:40px">b. request a service name using &quot;requ=
est-&gt;name&quot;</div><div class=3D"gmail_default" style=3D"font-family:t=
imes new roman,serif;margin-left:40px">c. register your object path and int=
erface <br></div><div class=3D"gmail_default" style=3D"font-family:times ne=
w roman,serif">The above file would essentially do nothing other than just =
create a dbus sensor.<br></div><div class=3D"gmail_default" style=3D"font-f=
amily:times new roman,serif;margin-left:40px"><br></div><div class=3D"gmail=
_default" style=3D"font-family:times new roman,serif">4. Create entries in =
the CMakeLists.txt file in dbus-sensors to build your .cpp file and make su=
re it corresponds with the sensor type you created in intel-ipmi-oem in ste=
p 2.<br></div><div class=3D"gmail_default" style=3D"font-family:times new r=
oman,serif"><br></div><div class=3D"gmail_default" style=3D"font-family:tim=
es new roman,serif">5. Once the above step is done, if you build an image, =
you should see the sensor you created (say something like &quot;/xyz/openbm=
c_project/sensors/processor/Processor_Error&quot; ) if you do &quot;ipmitoo=
l sdr elist all&quot;. The sensor will be created with a dynamically assign=
ed sensor number just like all the threshold based sensors. However, instea=
d of displaying a value like it would for a threshold sensor it will say &q=
uot;Event-Only&quot;. At this point your discrete sensor is created but doe=
sn&#39;t really do anything</div><div class=3D"gmail_default" style=3D"font=
-family:times new roman,serif"><br></div><div class=3D"gmail_default" style=
=3D"font-family:times new roman,serif">6. Now, in order to generate a SEL, =
we use the IpmiSelAdd method that is present in the sel-logger service:</di=
v><div class=3D"gmail_default" style=3D"font-family:times new roman,serif">=
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures"># busctl introspect=
<span>=C2=A0 </span>xyz.openbmc_project.Logging.IPMI /xyz/openbmc_project/L=
ogging/IPMI</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">NAME<span>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>TYPE<span>=C2=A0 =C2=A0 =C2=A0 </spa=
n>SIGNATURE RESULT/VALUE FLAGS</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures"><b>org.freedesktop.=
DBus.Introspectable</b> interface - <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </spa=
n>-<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>-</span></span></=
p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">.Introspect <span>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>method<span>=C2=A0 =C2=A0 </span>- <span>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>s<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </spa=
n>-</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures"><b>org.freedesktop.=
DBus.Peer <span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0</span></b> interface - <=
span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>-<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>-</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">.GetMachineId <span=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>method<span>=C2=A0 =C2=A0 </span>- <span>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 </span>s<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>-</sp=
an></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">.Ping <span>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span>method<span>=C2=A0 =C2=A0 </span>- <span>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>-<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>-</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures"><b>org.freedesktop.=
DBus.Properties <span>=C2=A0 =C2=A0</span></b> interface - <span>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>-<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>-</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">.Get<span>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>method<span>=C2=A0 =C2=A0 </span>ss<=
span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>v<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 </span>-</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">.GetAll <span>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 </span>method<span>=C2=A0 =C2=A0 </span>s <span>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 </span>a{sv}<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>=
-</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">.Set<span>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>method<span>=C2=A0 =C2=A0 </span>ssv=
 <span>=C2=A0 =C2=A0 =C2=A0 </span>-<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>-</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">.PropertiesChanged<=
span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>=
signal<span>=C2=A0 =C2=A0 </span>sa{sv}as<span>=C2=A0 </span>-<span>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>-</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures"><b>xyz.openbmc_proj=
ect.Logging.IPMI<span>=C2=A0 =C2=A0</span></b> interface - <span>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 </span>-<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
/span>-</span></span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">.IpmiSelAdd <span>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 </span>method<span>=C2=A0 =C2=A0 </span>ssaybq<span>=C2=A0 =C2=
=A0 </span>q<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>-</span>=
</span></p>
<p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asian:=
normal;font-stretch:normal;font-size:11px;line-height:normal;font-family:Me=
nlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><sp=
an style=3D"font-variant-ligatures:no-common-ligatures">.IpmiSelAddOem<span=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 </span>method<span>=C2=A0 =C2=A0 </span>sayy<span>=C2=A0 =C2=A0 =C2=A0 =
</span>q<span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>-</span></sp=
an></p></div><div class=3D"gmail_default" style=3D"font-family:times new ro=
man,serif"><br></div><div class=3D"gmail_default" style=3D"font-family:time=
s new roman,serif">As you can see above, the IpmiSelAdd method takes 6 argu=
ments, &#39;ssaybq&#39; as described in <a href=3D"https://dbus.freedesktop=
.org/doc/dbus-specification.html#type-system" target=3D"_blank">https://dbu=
s.freedesktop.org/doc/dbus-specification.html#type-system.<br></a></div><di=
v class=3D"gmail_default" style=3D"font-family:times new roman,serif">Looki=
ng at the code in phosphor-sel-logger where the IpmiSelAdd method is regist=
ered, we can see what the ssaybq arguments correspond to:</div><div class=
=3D"gmail_default" style=3D"font-family:times new roman,serif"><p style=3D"=
margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span style=3D"background-colo=
r:rgb(238,238,238)"><span style=3D"font-variant-ligatures:no-common-ligatur=
es">ifaceAddSel-&gt;register_method(</span></span></p><p style=3D"margin:0p=
x;font:11px Menlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238=
,238,238)"><span style=3D"font-variant-ligatures:no-common-ligatures"><span=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span style=3D"font-variant-liga=
tures:no-common-ligatures;color:rgb(180,36,25)">&quot;IpmiSelAdd&quot;</spa=
n><span style=3D"font-variant-ligatures:no-common-ligatures">, [](</span><s=
pan style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(47,180,29=
)">const</span><span style=3D"font-variant-ligatures:no-common-ligatures"> =
std::string &amp;message, </span><span style=3D"font-variant-ligatures:no-c=
ommon-ligatures;color:rgb(47,180,29)">const</span><span style=3D"font-varia=
nt-ligatures:no-common-ligatures"> std::string &amp;path,</span></span></p>=
<p style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span style=3D"bac=
kground-color:rgb(238,238,238)"><span style=3D"font-variant-ligatures:no-co=
mmon-ligatures"><span>=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span style=3D"font-va=
riant-ligatures:no-common-ligatures;color:rgb(47,180,29)">const</span><span=
 style=3D"font-variant-ligatures:no-common-ligatures"> std::vector&lt;</spa=
n><span style=3D"font-variant-ligatures:no-common-ligatures;color:rgb(47,18=
0,29)">uint8_t</span><span style=3D"font-variant-ligatures:no-common-ligatu=
res">&gt; &amp;selData,</span></span></p><p style=3D"margin:0px;font-varian=
t-numeric:normal;font-variant-east-asian:normal;font-stretch:normal;font-si=
ze:11px;line-height:normal;font-family:Menlo;color:rgb(0,0,0)">








</p><p style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-as=
ian:normal;font-stretch:normal;font-size:11px;line-height:normal;font-famil=
y:Menlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"=
><span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0</span></span><span style=3D"font-variant-ligatures:no-common-lig=
atures;color:rgb(47,180,29)">const</span><span style=3D"font-variant-ligatu=
res:no-common-ligatures"> </span><span style=3D"font-variant-ligatures:no-c=
ommon-ligatures;color:rgb(47,180,29)">bool</span><span style=3D"font-varian=
t-ligatures:no-common-ligatures"> &amp;assert, </span><span style=3D"font-v=
ariant-ligatures:no-common-ligatures;color:rgb(47,180,29)">const</span><spa=
n style=3D"font-variant-ligatures:no-common-ligatures"> </span><span style=
=3D"font-variant-ligatures:no-common-ligatures;color:rgb(47,180,29)">uint16=
_t</span><span style=3D"font-variant-ligatures:no-common-ligatures"> &amp;g=
enId) {</span></span></p></div><div class=3D"gmail_default" style=3D"font-f=
amily:times new roman,serif"><br></div><div class=3D"gmail_default" style=
=3D"font-family:times new roman,serif">Based on this, we can directly call =
the method using busctl to test if a SEL is created for the discrete sensor=
. For example, for the sensor we created in step 5, we could do the followi=
ng to generate a SEL:</div><div class=3D"gmail_default" style=3D"font-famil=
y:times new roman,serif"><span style=3D"background-color:rgb(238,238,238)">=
busctl call xyz.openbmc_project.Logging.IPMI /xyz/openbmc_project/Logging/I=
PMI xyz.openbmc_project.Logging.IPMI IpmiSelAdd ssaybq &lt;message string&g=
t; &lt;sensor object path, i.e &quot;/xyz/openbmc_project/sensors/processor=
/Processor_Error&quot;&gt;=C2=A0 &lt;number of bytes in the event data vect=
or, which in this case would be 3&gt;=C2=A0 &lt;event data vector&gt;=C2=A0=
 &lt; assert/de-assert yes/no&gt;=C2=A0 &lt;generator id, 0x0020 for bmc&gt=
;</span></div><div class=3D"gmail_default" style=3D"font-family:times new r=
oman,serif"><span style=3D"background-color:rgb(238,238,238)"><br></span></=
div><div class=3D"gmail_default" style=3D"font-family:times new roman,serif=
"><span style=3D"background-color:rgb(238,238,238)"><span style=3D"backgrou=
nd-color:rgb(255,255,255)">(the first 4 arguments after &#39;call&#39; are =
the service, object, interface and the method)</span><br></span></div><div =
class=3D"gmail_default" style=3D"font-family:times new roman,serif"><span s=
tyle=3D"background-color:rgb(238,238,238)"><br></span></div><div class=3D"g=
mail_default" style=3D"font-family:times new roman,serif"><span style=3D"ba=
ckground-color:rgb(255,255,255)"><span></span></span>To give you an example=
, here is what the above command looks like for a discrete sensor for a pow=
er button press:</div><div class=3D"gmail_default" style=3D"font-family:tim=
es new roman,serif">Command:</div><div class=3D"gmail_default" style=3D"fon=
t-family:times new roman,serif"><span style=3D"background-color:rgb(238,238=
,238)"># busctl call xyz.openbmc_project.Logging.IPMI /xyz/openbmc_project/=
Logging/IPMI xyz.openbmc_project.Logging.IPMI IpmiSelAdd ssaybq &quot;SEL E=
ntry&quot; &quot;/xyz/openbmc_project/sensors/pwr_button/POWER_BUTTON&quot;=
 3 {0x00,0x01,0x00} yes 0x20</span></div><div class=3D"gmail_default" style=
=3D"font-family:times new roman,serif">=C2=A0</div><div class=3D"gmail_defa=
ult" style=3D"font-family:times new roman,serif">Sel generated:<br></div><d=
iv class=3D"gmail_default" style=3D"font-family:times new roman,serif"><spa=
n style=3D"background-color:rgb(238,238,238)">f | 07/17/20 | 16:49:01 UTC |=
 Button POWER BUTTON | Power Button pressed | Asserted</span></div><div cla=
ss=3D"gmail_default" style=3D"font-family:times new roman,serif"><span styl=
e=3D"background-color:rgb(238,238,238)"><br></span></div><div class=3D"gmai=
l_default" style=3D"font-family:times new roman,serif">7. If you have a ser=
vice that triggers on an event, you could directly call the above command t=
o generate a SEL in your service file. For example, we have a gpio service =
that triggers on certain events and we directly call the above command from=
 the service file. In other cases we call a method to generate the SEL in c=
ode in the event &quot;handler&quot; function. This might be more relevant =
for our host-error-monitor case. Here is an example from our code for how w=
e call the IpmiSelAdd method:</div><div class=3D"gmail_default" style=3D"fo=
nt-family:times new roman,serif"><p style=3D"margin:0px;font:11px Menlo;col=
or:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,238)"><span styl=
e=3D"font-variant-ligatures:no-common-ligatures">sdbusplus::message::messag=
e writeSEL =3D conn-&gt;new_method_call(</span></span></p><p style=3D"margi=
n:0px;font:11px Menlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb=
(238,238,238)"><span style=3D"font-variant-ligatures:no-common-ligatures"><=
span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>ipmiSelService, ipmiS=
elPath, ipmiSelAddInterface, </span><span style=3D"font-variant-ligatures:n=
o-common-ligatures;color:rgb(180,36,25)">&quot;IpmiSelAdd&quot;</span><span=
 style=3D"font-variant-ligatures:no-common-ligatures">);</span></span></p><=
p style=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span style=3D"back=
ground-color:rgb(238,238,238)"><span style=3D"font-variant-ligatures:no-com=
mon-ligatures"><span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>writeSEL.append(ipm=
iSelAddMessage, dbusPath, eventData, assert, genId);</span></span></p><p st=
yle=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0);min-height:13px"><span s=
tyle=3D"background-color:rgb(238,238,238)"><span style=3D"font-variant-liga=
tures:no-common-ligatures"></span><br></span></p><p style=3D"margin:0px;fon=
t:11px Menlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb(238,238,=
238)"><span style=3D"font-variant-ligatures:no-common-ligatures"><span>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 </span></span><span style=3D"font-variant-ligature=
s:no-common-ligatures;color:rgb(193,101,28)">try</span></span></p><p style=
=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span style=3D"background-=
color:rgb(238,238,238)"><span style=3D"font-variant-ligatures:no-common-lig=
atures"><span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>{</span></span></p><p styl=
e=3D"margin:0px;font:11px Menlo;color:rgb(0,0,0)"><span style=3D"background=
-color:rgb(238,238,238)"><span style=3D"font-variant-ligatures:no-common-li=
gatures"><span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 </span>conn-&gt;ca=
ll(writeSEL);</span></span></p><p style=3D"margin:0px;font-variant-numeric:=
normal;font-variant-east-asian:normal;font-stretch:normal;font-size:11px;li=
ne-height:normal;font-family:Menlo;color:rgb(0,0,0)"><span style=3D"backgro=
und-color:rgb(238,238,238)"><span style=3D"font-variant-ligatures:no-common=
-ligatures">












</span></span></p><p style=3D"margin:0px;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;font-stretch:normal;font-size:11px;line-height:nor=
mal;font-family:Menlo;color:rgb(0,0,0)"><span style=3D"background-color:rgb=
(238,238,238)"><span style=3D"font-variant-ligatures:no-common-ligatures"><=
span>=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</span>}</span></span></p></div><div =
class=3D"gmail_default" style=3D"font-family:times new roman,serif"><br></d=
iv><div class=3D"gmail_default" style=3D"font-family:times new roman,serif"=
>Here, conn is the &quot;shared_ptr&quot;. The other arguments are pretty m=
uch the same as described in the busctl command in #6.=C2=A0 Not sure how t=
his would work with host-error-monitor but you can try it with the relevant=
 shared_ptr in host_error_monitor.cpp and it might possibly work.</div><div=
 class=3D"gmail_default" style=3D"font-family:times new roman,serif"><br></=
div><div class=3D"gmail_default" style=3D"font-family:times new roman,serif=
">Hope this helps.</div><div class=3D"gmail_default" style=3D"font-family:t=
imes new roman,serif"><br></div><div class=3D"gmail_default" style=3D"font-=
family:times new roman,serif">-Varun <br></div><div class=3D"gmail_default"=
 style=3D"font-family:times new roman,serif"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 14, 2020=
 at 3:07 PM Patrick Voelker &lt;<a href=3D"mailto:Patrick_Voelker@phoenix.c=
om" target=3D"_blank">Patrick_Voelker@phoenix.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div>
<p class=3D"MsoNormal">Hi, I=E2=80=99d like to log IPMI SEL events for chan=
ges in the signals monitored by OpenBMC/host-error-monitor.=C2=A0 I don=E2=
=80=99t have much experience with OpenBMC=E2=80=99s sensors yet so I=E2=80=
=99m not sure what the best approach is and am looking for some guidance.<u=
></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I haven=E2=80=99t found a good example yet of a IPMI=
 discrete sensor and I don=E2=80=99t want to put IPMI specific information =
into host-error-monitor to directly add SEL events via phosphor-sel-logger.=
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Here=E2=80=99s my understanding thus far :<u></u><u>=
</u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">* A module needs to instantiate dbus sensors represe=
nting the signals being monitored.=C2=A0 This could be done in host-error-m=
onitor or duplicate some of the functionality in dbus-sensors.=C2=A0 Is the=
re a benefit to extending one over the other?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">* One or more IPMI SDRs should be created for the IP=
MI sensors needed to group all the necessary discrete offsets.=C2=A0 If I=
=E2=80=99m using entity-manager in my build, is that where I would define t=
his sensor?=C2=A0 If not, is there some other way to accomplish
 this?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">* phosphor-sel-logger then needs to monitor (match) =
dbus discrete sensor property changes to create appropriate IPMI and redfis=
h logs for the events as they occur.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Does that sound about right? Thanks in advance for y=
our help.<u></u><u></u></p>
</div>
</div>

</blockquote></div>

--00000000000030b1b905aaa63e06--
