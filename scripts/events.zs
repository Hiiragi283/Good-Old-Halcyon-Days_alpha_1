#====================================================================
# ファイル名 : events.zs
# 作成者 : Hiiragi Russell Tsubasa: https://github.com/Hiiragi283
# 情報 : Scripts for tweaking events
#====================================================================

#priority 98
#loader crafttweaker reloadableevents

//crafttweakerからclassをimport
import crafttweaker.event.PlayerTickEvent;
import crafttweaker.events.IEventManager;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.player.IPlayer;
import crafttweaker.potions.IPotion;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.world.IWorld;

//scriptのimport
//import scripts.HiiragiUtils;

//このscriptの読み込みの開始をログに出力
print("Start loading events.zs ...");

//変数の定義
events.onPlayerTick(function(event as PlayerTickEvent) {
	val player as IPlayer = event.player;
	val world as IWorld = player.world;
	if (!world.remote) {
		//20tickに1回処理を挟む
		if (world.getWorldTime() % 20 == 0) {
			//特定のアイテムを利き手に持っている際にイベントを起こす
			if (!isNull(player.mainHandHeldItem)) {
				var itemMain as IItemStack = player.mainHandHeldItem;
				//Bedrockium Ingot
				if (itemMain.matches(<contenttweaker:ingot_bedrockium>) || itemMain.matches(<contenttweaker:block_bedrockium>)) {
					player.addPotionEffect(<potion:minecraft:slowness>.makePotionEffect(120, 4));
				}
				//Rainbow Stone
				if (itemMain.matches(<extrautils2:decorativesolid:8>)) {
					player.addPotionEffect(<potion:minecraft:glowing>.makePotionEffect(120, 36));
				}
			}
			//特定のアイテムを利き手とは逆に持っている際にイベントを起こす
			if (!isNull(player.offHandHeldItem)){
				var itemOff as IItemStack = player.offHandHeldItem;
				//Rainbow Ingot
				if (itemOff.matches(<contenttweaker:ingot_rainbow>)) {
					player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:minecraft:fire_resistance>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:minecraft:haste>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:dcs_climate:dcs.potion.bird>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:dcs_lib:dcs.potion.freeze_res>.makePotionEffect(120, 7));
					player.addPotionEffect(<potion:minecraft:night_vision>.makePotionEffect(120, 7));
				}
			}
			//温泉につかると再生バフを付与
			if(world.getBlock(player.position).definition.id == "dcs_climate:dcs_fluidblock_hotspring") {
				player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(220, 0));
			}
			//魔材につかると吐き気デバフを付与
			if(world.getBlock(player.position).definition.id == "dcs_climate:dcs_fluidblock_mazai") {
				player.addPotionEffect(<potion:minecraft:nausea>.makePotionEffect(220, 0));
			}
			//液体青スライムにつかると跳躍力上昇バフを付与
			if(world.getBlock(player.position).definition.id == "tconstruct:blueslime") {
				player.addPotionEffect(<potion:minecraft:jump_boost>.makePotionEffect(220, 2));
			}
			//液体紫スライムにつかると幸運バフを付与
			if(world.getBlock(player.position).definition.id == "tconstruct:purpleslime") {
				player.addPotionEffect(<potion:minecraft:luck>.makePotionEffect(220, 2));
			}
		}
	}
});

//このscriptの読み込みの完了をログに出力
print("events.zs loaded!");
