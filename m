Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 419BD522DCD
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 10:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KynSt0MkRz3c8R
	for <lists+openbmc@lfdr.de>; Wed, 11 May 2022 18:02:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=l4Uh8Cy0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yahoo.com (client-ip=77.238.178.200;
 helo=sonic303-19.consmr.mail.ir2.yahoo.com; envelope-from=niikita@yahoo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256
 header.s=s2048 header.b=l4Uh8Cy0; dkim-atps=neutral
Received: from sonic303-19.consmr.mail.ir2.yahoo.com
 (sonic303-19.consmr.mail.ir2.yahoo.com [77.238.178.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KynST40Cnz2xnT
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2022 18:02:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1652256129; bh=cIuj9SaINZOJjzSgGDWtStkP8njzjfrOsV+TNGiY9xA=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=l4Uh8Cy0rbcxZcrMqAmzf5JiFhMG2ZafpGvwNtNY/p2b2BFOw5rZLSmIUFyYClPQTNq5JTZEHvg7xhWQr7XyZyavaua7dflXEIBhF/feuBlZ03F2TeFHexvOH1Va/6/H124m38NXsfCT2xZ8bTd8D5yNtSgh/YeasznsbfUc5uVVecLemMVi2Kvn1IZQu5fhVai95Blq0ghbViZtRoikNFymCSqUD1hXwTvfPS7wdffXDUsbUsTOrLJrouk2Jcz7lb+OLOTvGZjvFZW+3Q5u4vZj8lxx9iKFABukyKihUtP6+6U9vKJTVaFb61+xMdkdTCyiivjCMpNew5cuFY90wg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1652256129; bh=xTgA5zjqdtqvxzESr6FW9hMa3kCcOJwsBDDoxsp1oVM=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=M2PRG7BHQR/GZW1FEklbFeRXEaiOeDXpJLsIsb22UF7VdzxCFOd9FAITKJWRDDLYkEHy75FL1RTRiX+wxiPSAXbWajFN8Sf9CxtvQyXcZewAdnB+Scp4qAvZq33eOyC26zVs7gN/EIKWLa7sCJnz1eMlU1QBAM31/5sDbut+apFpshHOByKmrETXxfe9Vu1wpmNPi0Ydw0N0nFku/NMrWq6XwnvaEXR/0Lzfze4d3HeZRGC2PCD3Xt61WmO4F5SunBAXggP0j8Uv0+QO6qvaNIk0/mA+ylEPgvF783P0swUwCog0vPeL9xyPvBY6mV7c9V2opp/39zfC67Yox/9Ggg==
X-YMail-OSG: bgWZDxAVM1n7lF5MjCn4kko5czP_yjQa48stoWXXakhBbLUY0md1ruQEfI05CB1
 ZpDmJ3qBUNTKkY.8pk2tD7m6y6EI8b4cIceeB_nP6T0jD35mXN0S.uGKckQbBNDXG.7O2viIKpsC
 sy5Fa1kU2mFqAJmx7MdXe4f5CiHlHI3dyaj_ry7O.GdsRSWbdjyY0nWZgWVPEznwVnz_WMq.cmqe
 AJaLXgrfKEE1XaqbDz8myaePyzE3Uzc2B8CSkN0qLp0SLkU6Jphu.RQZKFTnG1cBQQSvrEC6nr5j
 V0v5il1EgD3GLs0.GlaLs2Ix9JPEG6.SPdblDxA20JVE6Ma9g2OvVeuNs0o1NglhZ_P5r5yVICuo
 DBle3ND6ASwjdsPvHhYzPuej3U.XrjtB4N5E5qG91X3PvYDN5aHEfPZeJd0d9.k3DIrfxAT3H1jI
 T7QPD3MDEpMvjnZ2TB0NT2_4wnqWQRhH_46xYXoVwzOh80Y28LT35IMUtVKRZnWZbh8PaMY2Lh67
 c_ET9YwT9xCAZnJxfAhxQWn5gXAaydoPPkm2ZCG9xz2dvF42RtBocF2VNO_E.46zNk4Di3ztpBEF
 YO6_XJ5g7RFSiAdfq5FT8sKr2ShwMkVMhKq2n_qD3a1OT9FjKIBoWE2DBJk6RNuo0pnYLU4MXE0B
 vf1e7Bt49moGgExUj19MCBsuH24jfA6GCmsuHdePgm3lwSkNM9NYDNfEf2rtVzJWPliS1wz5LpvJ
 trcKTZPRn9H4y2Fw35EF9TJcf6jZ7TsGO4HbXP60w4jHxzz_mEiLlZjLNJkRviQlK48kWrMCnXUI
 V7VF2mXnHbuPDAqZ_3LqzIqhZLVDhyCEDVOYzvAlzVWFMgY4owchuw6Mr2NfSB08neHfcZ08IcXT
 4ea8ekGJZjYDBaFUXHyqu5IX1fR.gc9TzU8jkCMqkonltbsxE9_FcNlQhgt5w_4I5DovX5JoN_AG
 OKz2TNqMLoKlt8.EkiKqy1SC9O0kY8S2zkQ9BONi684xc2m0znRDIxNUj1GB.pM52ri4zB8kM4gC
 720cy_O0MT0VDFkT7AlQx.DZpgMFq.pV7a8W15AP26IXo0WZYvIATRpgecAdEJ9SLZRjHwO9PPry
 jR73zh32dqH0zt4hJumHeQQgVHrtrA04z7Du7HDs7SYzpozlE25A5RX7BQQXd9VoCmO1ayYu6fF7
 .Gwf.emXnkP0fEhsMS4N93drDH7LY0RofOPThYA22h1jEUDjF5Sf_A5F1DMXy1OHSHclCLK7XuoR
 tkMfOWxFVluXSv9WQzDrxoJqJai9yJ0v99zA0Rx2vz6NtDh_vM7qLpNSd.m2hv.oQeQGAzv_Hqyy
 Nvas_BCToW0LXVnJtOtKeDbNpISPwJyCaPh_rVDS88aevXikFhoio6mR1PPuT6XKMPtUuTrzyfVy
 Xvq4CW613738wyXkbBnLYxdhsML4PMvyyg2neJD4P1GdnWQEnMFpDIFR1AxrRTCsKkkMuSJ3JKUk
 lh7ea8ZglsXnpWiaJXa2SE4jHhKgv2xzGWYb2SknWkGl0JMfdNNtNe9xaJ.UdPMyYCA5zsx91FNV
 5bNM4JZW__EPu19GXMYfHRAyusiKIdIY5A6Kk8OUpNbYsZsi_XEY2QCLVLpfdK05Hc4ty92DgnRk
 4ASyBgou4QEz3ocFfUsQuhJ0BVwy9QCLzXZ0SPrbL28gmf_9OHbdK.nRX2KgIpjpYuubi5baqutV
 5cl19zAhXNqHa_2TBh42b1RYtiHI2.bVAIrFG7osUJFziyiYZ4HbCgClOgPA9Oe3cua_BKkGVQ9D
 lr1aVFYNCjaJkG0Ag.Yps2TTQ3Q0Wc.MXGUj.vdkpfwXErfN7njdmFqlZTsRvGfAPsp.8SOxr0fO
 LiELEpxVqIBhLmL.zUuvk3VsZQ4Uuj8pbCb9JkyPEVXRiLXIu8FWhixZgMszSC.jC7n6bg7pL3ft
 PJQPU8YENZSJmsixEBBViryWw.S4pbggSJkwBj34ECmcMU9TqyFZo6BSDQw2Ai.QXRqChmE8h4Th
 1RG6MVeC6YToKucv1vlLoBGS0H7JsaHjCjBaaWthOS4.Cu7ME7LJMPmJye5_nQtrlAuhNDIb5qXE
 wMJQaC6OPwX2EXu4cU0dxiahXWm9mawJbTgSAFJOsy3isZhmS3nEZrJq8To.BMrE7RvP5oYRr_U9
 ZvJBrwpeIQ630EvhJEve98P92LiWRSg--
X-Sonic-MF: <niikita@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ir2.yahoo.com with HTTP; Wed, 11 May 2022 08:02:09 +0000
Date: Wed, 11 May 2022 08:05:55 +0000 (UTC)
From: Nikita Pavlov <niikita@yahoo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <1672954866.3142932.1652256355764@mail.yahoo.com>
In-Reply-To: <93960ad8-105b-fc06-b5e8-a4f2c443c473@linux.intel.com>
References: <1790304102.3756861.1651157909253.ref@mail.yahoo.com>
 <1790304102.3756861.1651157909253@mail.yahoo.com>
 <MW3PR11MB4732097DE3322E07CD2F99C2A3FD9@MW3PR11MB4732.namprd11.prod.outlook.com>
 <667725503.727721.1651325136829@mail.yahoo.com>
 <93960ad8-105b-fc06-b5e8-a4f2c443c473@linux.intel.com>
Subject: Re: x86-power-control question: front panel buttons dont work
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_3142931_1805525701.1652256355761"
X-Mailer: WebService/1.1.20188 YMailNorrin
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

------=_Part_3142931_1805525701.1652256355761
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Jason,=C2=A0
Front panel stop working from there until the next=C2=A0reboot even after s=
topping gpioset.
I test it with getting POWER_OUT line value and then released line like thi=
s:
#include <gpiod.hpp>
#include <iostream>
int main(int argc, char** argv){=C2=A0 =C2=A0 gpiod::line line =3D gpiod::f=
ind_line("POWER_OUT");=C2=A0 =C2=A0 if (!line)=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 std::cerr << "find line error\n";=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
return -1;=C2=A0 =C2=A0 }
=C2=A0 =C2=A0 try=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 line.request({"=
pwr", gpiod::line_request::EVENT_BOTH_EDGES, {}});=C2=A0 =C2=A0 }=C2=A0 =C2=
=A0 catch (const std::exception& ec)=C2=A0 =C2=A0 {=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 std::cerr << ec.what();=C2=A0 =C2=A0 }
=C2=A0 =C2=A0 int state =3D line.get_value();=C2=A0 =C2=A0 std::cout << sta=
te << '\n';=C2=A0 =C2=A0 line.release();
=C2=A0 =C2=A0 return 0;}

But front panel button also doesnt work with getting value.
--
Best regards,
Nikita Pavlov,
NUST MISiS Student
=20

    =D0=BF=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA, 2 =
=D0=BC=D0=B0=D1=8F 2022 =D0=B3., 18:36:24 GMT+3, Bills, Jason M <jason.m.bi=
lls@linux.intel.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(-=D0=B0): =
=20
=20
 Hi Nikita,

On 4/30/2022 7:25 AM, Nikita Pavlov wrote:
> Hi Jason, thank you for your response. In my platform I have=20
> power-control gpios in GPIOD group like this:
>=20
> /*D0-D7*/ "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
>=20
> Also I configurate pass-through mode in dts:
>=20
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-names =3D "pass-through";
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pinctrl-0 =3D <&pinctrl_gpid0_default
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0&pinctrl_gpid2_default>;

Could you please share what is your BMC hardware version?
>=20
> After update and reboot platform I have same problem - front panel=20
> buttons dont enable (front panel buttons dont enable if I use=20
> x86-power-control module or manually set gpio values by gpioset utility).
> But if I dont use any impacts on gpio (disable x86-power-control module=
=20
> and dont use gpio utilities like gpioset/get) front panel buttons work we=
ll.
>=20
> What are your assumptions about this ?

The pass-through is set up as a mux in pinctrl.=C2=A0 If I remember=20
correctly, the output pin has GPIO output and pass-through mode as two=20
different options in the pinctrl mux.

So, when you request the output pin using libgpiod, it automatically=20
configures the pinctrl to disable the pass-through. You should be able=20
to re-enable pass-through by simply releasing control of the output pin=20
in libgpiod.

For simplicity, let's work with just the gpioset utility and not use=20
x86-power-control.=C2=A0 So, when you initially boot, the pass-through is=
=20
working. You then use gpioset to change the output pin (which will=20
switch the pinctrl mux and disable pass-through mode causing the front=20
panel to stop working). When you stop gpioset, it should release the=20
gpio and switch the mux back to enable pass-through mode for the front=20
panel to work again.

In your test does the front panel start working again after stopping=20
gpioset? Or does the front panel stop working from there until the next=20
reboot even after stopping gpioset?

Thanks,
-Jason

>=20
>=20
>=20
> --
> Best regards,
> Nikita Pavlov,
> NUST MISiS Student
>=20
>=20
>=20
> =D1=87=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3, 28 =D0=B0=D0=BF=D1=80=D0=B5=
=D0=BB=D1=8F 2022 =D0=B3., 23:01:13 GMT+3, Bills, Jason M=20
> <jason.m.bills@intel.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(-=D0=
=B0):
>=20
>=20
> Hi Nikita,
>=20
> In the hardware, we have the power button routed through a GPIO=20
> pass-through on the Aspeed chip.=C2=A0 If that pass-through is disabled, =
it=20
> will prevent the physical front panel button signal from getting past=20
> the BMC.=C2=A0 That is the first thing I would check.
>=20
> Also, it is better to send these kinds of questions to the OpenBMC=20
> mailing list as there may be others in the community in a similar situati=
on.
>=20
> Thanks,
>=20
> -Jason
>=20
> *From:* Nikita Pavlov <niikita@yahoo.com>
> *Sent:* Thursday, April 28, 2022 8:58 AM
> *To:* Bills, Jason M <jason.m.bills@intel.com>; kuiying.wang@intel.com
> *Subject:* x86-power-control question: front panel buttons dont work
>=20
> Hi, I user x86-power-control module for my test intel platform. Its=20
> module works in webui but front panel physical buttons doesnt work. I=20
> think that it interface describe in this fragment=20
> https://github.com/openbmc/x86-power-control/blob/master/src/power_contro=
l.cpp#L3072=20
> <https://github.com/openbmc/x86-power-control/blob/master/src/power_contr=
ol.cpp#L3072>=C2=A0but=20
> I cant understand this logic.
>=20
> Say me pls, why front panel buttons dont work ?
>=20
> --
> Best regards,
> Nikita Pavlov,
> NUST MISiS Student
>=20
 =20
------=_Part_3142931_1805525701.1652256355761
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpe4b991acyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">Hi Jason,&nbsp;</div><div di=
r=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"f=
alse"><div dir=3D"ltr" data-setdir=3D"false"><span style=3D"font-family: He=
lvetica Neue, Helvetica, Arial, sans-serif;">Front panel stop working from =
there until the next&nbsp;</span><span style=3D"font-family: Helvetica Neue=
, Helvetica, Arial, sans-serif;">reboot even after stopping gpioset.</span>=
</div><div dir=3D"ltr" data-setdir=3D"false"><span style=3D"font-family: He=
lvetica Neue, Helvetica, Arial, sans-serif;"><br></span></div><div dir=3D"l=
tr" data-setdir=3D"false">I test it with getting POWER_OUT line value and t=
hen released line like this:</div><div dir=3D"ltr" data-setdir=3D"false"><d=
iv><div><br></div><div>#include &lt;gpiod.hpp&gt;</div><div><br></div><div>=
#include &lt;iostream&gt;</div><div><br></div><div>int main(int argc, char*=
* argv)</div><div>{</div><div>&nbsp; &nbsp; gpiod::line line =3D gpiod::fin=
d_line("POWER_OUT");</div><div>&nbsp; &nbsp; if (!line)</div><div>&nbsp; &n=
bsp; {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; std::cerr &lt;&lt; "find line =
error\n";</div><div>&nbsp; &nbsp; &nbsp; &nbsp; return -1;</div><div>&nbsp;=
 &nbsp; }</div><div><br></div><div>&nbsp; &nbsp; try</div><div>&nbsp; &nbsp=
; {</div><div>&nbsp; &nbsp; &nbsp; &nbsp; line.request({"pwr", gpiod::line_=
request::EVENT_BOTH_EDGES, {}});</div><div>&nbsp; &nbsp; }</div><div>&nbsp;=
 &nbsp; catch (const std::exception&amp; ec)</div><div>&nbsp; &nbsp; {</div=
><div>&nbsp; &nbsp; &nbsp; &nbsp; std::cerr &lt;&lt; ec.what();</div><div>&=
nbsp; &nbsp; }</div><div><br></div><div>&nbsp; &nbsp; int state =3D line.ge=
t_value();</div><div>&nbsp; &nbsp; std::cout &lt;&lt; state &lt;&lt; '\n';<=
/div><div>&nbsp; &nbsp; line.release();</div><div><br></div><div>&nbsp; &nb=
sp; return 0;</div><div>}</div></div><br></div></div><div dir=3D"ltr" data-=
setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">But front=
 panel button also doesnt work with getting value.</div><div><br></div><div=
 class=3D"ydpe4b991acsignature"><div dir=3D"ltr" style=3D"font-family:Helve=
tica, Arial, sans-serif;font-size:16px;"><div><span style=3D"font-family:He=
lvetica, Arial, sans-serif;">--</span><br clear=3D"none" style=3D"font-fami=
ly:Helvetica, Arial, sans-serif;"><span style=3D"font-family:Helvetica, Ari=
al, sans-serif;">Best regards,</span><br clear=3D"none" style=3D"font-famil=
y:Helvetica, Arial, sans-serif;"><span style=3D"font-family:Helvetica, Aria=
l, sans-serif;">Nikita Pavlov,</span><br clear=3D"none" style=3D"font-famil=
y:Helvetica, Arial, sans-serif;"><span style=3D"font-family:Helvetica, Aria=
l, sans-serif;">NUST MISiS Student</span></div><br></div></div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"yahoo_quoted_2320514506" class=3D"yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    =D0=BF=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=
=D0=B8=D0=BA, 2 =D0=BC=D0=B0=D1=8F 2022 =D0=B3., 18:36:24 GMT+3, Bills, Jas=
on M &lt;jason.m.bills@linux.intel.com&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=BB(-=D0=B0):
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">Hi Nikita,<br clear=3D"none"><br clea=
r=3D"none">On 4/30/2022 7:25 AM, Nikita Pavlov wrote:<br clear=3D"none">&gt=
; Hi Jason, thank you for your response. In my platform I have <br clear=3D=
"none">&gt; power-control gpios in GPIOD group like this:<br clear=3D"none"=
>&gt; <br clear=3D"none">&gt; /*D0-D7*/ "POWER_BUTTON","POWER_OUT","RESET_B=
UTTON","RESET_OUT",<br clear=3D"none">&gt; <br clear=3D"none">&gt; Also I c=
onfigurate pass-through mode in dts:<br clear=3D"none">&gt; <br clear=3D"no=
ne">&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pinctrl-names =3D "pass-through"=
;<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pinctrl-0 =3D &l=
t;&amp;pinctrl_gpid0_default<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&n=
bsp;&nbsp;&nbsp;&amp;pinctrl_gpid2_default&gt;;<br clear=3D"none"><br clear=
=3D"none">Could you please share what is your BMC hardware version?<br clea=
r=3D"none">&gt; <br clear=3D"none">&gt; After update and reboot platform I =
have same problem - front panel <br clear=3D"none">&gt; buttons dont enable=
 (front panel buttons dont enable if I use <br clear=3D"none">&gt; x86-powe=
r-control module or manually set gpio values by gpioset utility).<br clear=
=3D"none">&gt; But if I dont use any impacts on gpio (disable x86-power-con=
trol module <br clear=3D"none">&gt; and dont use gpio utilities like gpiose=
t/get) front panel buttons work well.<br clear=3D"none">&gt; <br clear=3D"n=
one">&gt; What are your assumptions about this ?<br clear=3D"none"><br clea=
r=3D"none">The pass-through is set up as a mux in pinctrl.&nbsp; If I remem=
ber <br clear=3D"none">correctly, the output pin has GPIO output and pass-t=
hrough mode as two <br clear=3D"none">different options in the pinctrl mux.=
<br clear=3D"none"><br clear=3D"none">So, when you request the output pin u=
sing libgpiod, it automatically <br clear=3D"none">configures the pinctrl t=
o disable the pass-through. You should be able <br clear=3D"none">to re-ena=
ble pass-through by simply releasing control of the output pin <br clear=3D=
"none">in libgpiod.<br clear=3D"none"><br clear=3D"none">For simplicity, le=
t's work with just the gpioset utility and not use <br clear=3D"none">x86-p=
ower-control.&nbsp; So, when you initially boot, the pass-through is <br cl=
ear=3D"none">working. You then use gpioset to change the output pin (which =
will <br clear=3D"none">switch the pinctrl mux and disable pass-through mod=
e causing the front <br clear=3D"none">panel to stop working). When you sto=
p gpioset, it should release the <br clear=3D"none">gpio and switch the mux=
 back to enable pass-through mode for the front <br clear=3D"none">panel to=
 work again.<br clear=3D"none"><br clear=3D"none">In your test does the fro=
nt panel start working again after stopping <br clear=3D"none">gpioset? Or =
does the front panel stop working from there until the next <br clear=3D"no=
ne">reboot even after stopping gpioset?<br clear=3D"none"><br clear=3D"none=
">Thanks,<div class=3D"yqt5727141433" id=3D"yqtfd20813"><br clear=3D"none">=
-Jason<br clear=3D"none"><br clear=3D"none">&gt; <br clear=3D"none">&gt; <b=
r clear=3D"none">&gt; <br clear=3D"none">&gt; --<br clear=3D"none">&gt; Bes=
t regards,<br clear=3D"none">&gt; Nikita Pavlov,<br clear=3D"none">&gt; NUS=
T MISiS Student<br clear=3D"none">&gt; <br clear=3D"none">&gt; <br clear=3D=
"none">&gt; <br clear=3D"none">&gt; =D1=87=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=
=B3, 28 =D0=B0=D0=BF=D1=80=D0=B5=D0=BB=D1=8F 2022 =D0=B3., 23:01:13 GMT+3, =
Bills, Jason M <br clear=3D"none">&gt; &lt;<a shape=3D"rect" ymailto=3D"mai=
lto:jason.m.bills@intel.com" href=3D"mailto:jason.m.bills@intel.com">jason.=
m.bills@intel.com</a>&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB(-=D0=
=B0):<br clear=3D"none">&gt; <br clear=3D"none">&gt; <br clear=3D"none">&gt=
; Hi Nikita,<br clear=3D"none">&gt; <br clear=3D"none">&gt; In the hardware=
, we have the power button routed through a GPIO <br clear=3D"none">&gt; pa=
ss-through on the Aspeed chip.&nbsp; If that pass-through is disabled, it <=
br clear=3D"none">&gt; will prevent the physical front panel button signal =
from getting past <br clear=3D"none">&gt; the BMC.&nbsp; That is the first =
thing I would check.<br clear=3D"none">&gt; <br clear=3D"none">&gt; Also, i=
t is better to send these kinds of questions to the OpenBMC <br clear=3D"no=
ne">&gt; mailing list as there may be others in the community in a similar =
situation.<br clear=3D"none">&gt; <br clear=3D"none">&gt; Thanks,<br clear=
=3D"none">&gt; <br clear=3D"none">&gt; -Jason<br clear=3D"none">&gt; <br cl=
ear=3D"none">&gt; *From:* Nikita Pavlov &lt;<a shape=3D"rect" ymailto=3D"ma=
ilto:niikita@yahoo.com" href=3D"mailto:niikita@yahoo.com">niikita@yahoo.com=
</a>&gt;<br clear=3D"none">&gt; *Sent:* Thursday, April 28, 2022 8:58 AM<br=
 clear=3D"none">&gt; *To:* Bills, Jason M &lt;<a shape=3D"rect" ymailto=3D"=
mailto:jason.m.bills@intel.com" href=3D"mailto:jason.m.bills@intel.com">jas=
on.m.bills@intel.com</a>&gt;; <a shape=3D"rect" ymailto=3D"mailto:kuiying.w=
ang@intel.com" href=3D"mailto:kuiying.wang@intel.com">kuiying.wang@intel.co=
m</a><br clear=3D"none">&gt; *Subject:* x86-power-control question: front p=
anel buttons dont work<br clear=3D"none">&gt; <br clear=3D"none">&gt; Hi, I=
 user x86-power-control module for my test intel platform. Its <br clear=3D=
"none">&gt; module works in webui but front panel physical buttons doesnt w=
ork. I <br clear=3D"none">&gt; think that it interface describe in this fra=
gment <br clear=3D"none">&gt; <a shape=3D"rect" href=3D"https://github.com/=
openbmc/x86-power-control/blob/master/src/power_control.cpp#L3072 " target=
=3D"_blank">https://github.com/openbmc/x86-power-control/blob/master/src/po=
wer_control.cpp#L3072 </a><br clear=3D"none">&gt; &lt;<a shape=3D"rect" hre=
f=3D"https://github.com/openbmc/x86-power-control/blob/master/src/power_con=
trol.cpp#L3072" target=3D"_blank">https://github.com/openbmc/x86-power-cont=
rol/blob/master/src/power_control.cpp#L3072</a>&gt;&nbsp;but <br clear=3D"n=
one">&gt; I cant understand this logic.<br clear=3D"none">&gt; <br clear=3D=
"none">&gt; Say me pls, why front panel buttons dont work ?<br clear=3D"non=
e">&gt; <br clear=3D"none">&gt; --<br clear=3D"none">&gt; Best regards,<br =
clear=3D"none">&gt; Nikita Pavlov,<br clear=3D"none">&gt; NUST MISiS Studen=
t<br clear=3D"none">&gt; <br clear=3D"none"></div></div></div>
            </div>
        </div></body></html>
------=_Part_3142931_1805525701.1652256355761--
