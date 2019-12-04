Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D81127F0
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 10:42:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SYm75np9zDqJh
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 20:42:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.40.130;
 helo=mail-40130.protonmail.ch; envelope-from=rgrs@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.b="Tr97Ajy9"; 
 dkim-atps=neutral
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch
 [185.70.40.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SYjW0j0vzDqWt
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 20:39:55 +1100 (AEDT)
Date: Wed, 04 Dec 2019 09:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1575452389;
 bh=AFIBJPc9IP/llXp27rblmW59Nm6eFADpAvd3uQ+A+Ys=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=Tr97Ajy95k9Gdsn3Tg212ADyhotMwoCRel7nlOy7nUvji7m5SOZ1VXoBpJGxQ0GWn
 9DH03r3wTclOQ9d/kTQ74sZHTW1CQv/RXRUOb+oDmyIIs9IF/aDtEBF1x4hWdnRzDX
 jCoARIRHagE3X1rDQ5jUmKNaxSp+eWDT1aPtj69A=
To: James Feist <james.feist@linux.intel.com>
From: rgrs <rgrs@protonmail.com>
Subject: Re: Faking Sensor Readings
Message-ID: <x5Z3U1jaa8Tf-HK1htUFoCqgAFdtIXGaDyEU7SKkgNkehJEtqaps9BvN2j_D5lsgjEgoTL81fZ8nJLitwFaqW2zRkFK8vXhbCrld3Ziy43o=@protonmail.com>
In-Reply-To: <234c1d26-7b59-0926-d6c2-6c49f75aab3f@linux.intel.com>
References: <QVdDJHlLW9JS_3uowBPTzSCb1dwpqJjml0ORFR_aQGpuKCve1l8Qwy4GF4X0_dgJmExy8sjJQD_VjnI-o4xwoYhivHJlSPBt42fc1cuDKjw=@protonmail.com>
 <0a4bb951-4f85-728a-8426-af629c870908@yadro.com>
 <234c1d26-7b59-0926-d6c2-6c49f75aab3f@linux.intel.com>
Feedback-ID: N7x9TweAIUMPpfpzQuNzrCOD67M7xMEA9S-zwPBDoWaGjAvK1DkvyqGEcVQ17b2imFZOeXQ1Gawv906j51YTTw==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM autolearn=ham
 autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
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
Reply-To: rgrs <rgrs@protonmail.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Alexander Amelkin <a.amelkin@yadro.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi James,

I tried busctl set-property,  but the values didn't change.
Are the steps below correct?
(test with both 'field mode' enabled and disabled)

root@obmc:~# busctl introspect xyz.openbmc_project.Hwmon-2439434288.Hwmon1 =
 /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.openbmc_project.Se=
nsor.Value --no-pager
NAME                             TYPE      SIGNATURE RESULT/VALUE          =
                   FLAGS
.MaxValue                        property  x         0                     =
                   emits-change writable
.MinValue                        property  x         0                     =
                   emits-change writable
.Scale                           property  x         -3                    =
                   emits-change writable
.Unit                            property  s         "xyz.openbmc_project.S=
ensor.Value.Unit.=E2=80=A6 emits-change writable
.Value                           property  x         18500                 =
                   emits-change writable

root@obmc:~# busctl --no-pager set-property xyz.openbmc_project.Hwmon-24394=
34288.Hwmon1  /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.openb=
mc_project.Sensor.Value  Value x 50000

root@saber:~# busctl --no-pager get-property xyz.openbmc_project.Hwmon-2439=
434288.Hwmon1  /xyz/openbmc_project/sensors/temperature/INLET_TEMP xyz.open=
bmc_project.Sensor.Value  Value
x 18500

root@obmc:~#

Thanks,
Raj

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Wednesday, December 4, 2019 1:34 AM, James Feist <james.feist@linux.inte=
l.com> wrote:

&gt; On 12/3/19 5:49 AM, Alexander Amelkin wrote:
&gt;
&gt; &gt; 03.12.2019 15:06, rgrs wrote:
&gt; &gt;
&gt; &gt; &gt; Hi,
&gt; &gt; &gt; How do I fake sensor readings in OpenBMC?
&gt; &gt; &gt; We're trying to fake temperature sensors and make sure fans =
ramp up/down
&gt; &gt; &gt; accordingly.
&gt; &gt;
&gt; &gt; We ended up patching the kernel driver to fake the readings by re=
quest.
&gt; &gt; I'm not aware of any ready interface in OpenBMC for that.
&gt;
&gt; If you're using d-bus sensors, the sensor property is writable. It is
&gt; also supported by patching the sensor value in redfish.
&gt;
&gt; &gt; With best regards,
&gt; &gt; Alexander Amelkin

</james.feist@linux.intel.com>
